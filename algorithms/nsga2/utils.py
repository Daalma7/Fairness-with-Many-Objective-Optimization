from general.population import Population
import random
from general.ml import *

#Utility functions for the NSGA-II method
class NSGA2Utils:

    def __init__(self, problem, num_of_individuals=50,
                 num_of_tour_particips=2, tournament_prob=0.9, crossover_param=2, mutation_param=5, mutation_prob=0.1, beta_method='uniform'):

        self.problem = problem
        self.num_of_individuals = num_of_individuals
        self.num_of_tour_particips = num_of_tour_particips
        self.tournament_prob = tournament_prob
        self.crossover_param = crossover_param
        self.mutation_param = mutation_param
        self.mutation_prob = mutation_prob
        self.beta_method = beta_method

    #Initial population creation
    def create_initial_population(self, model):
        population = Population()
        first_individual = True
        for k in range(self.num_of_individuals):        #There will be at least 1 Gini and 1 Entropy individuals in this initial population
            if model == "DT":
                if k == 0:
                    individual = self.problem.generate_default_individual_gini()
                elif k == 1:
                    individual = self.problem.generate_default_individual_entropy()
                else:
                    individual = self.problem.generate_individual()
            
            if model == "LR":
                if k == 0:
                    individual = self.problem.generate_first_default_lr()
                elif k == 1:
                    individual = self.problem.generate_second_default_lr()
                else:
                    individual = self.problem.generate_individual()
            
            self.problem.calculate_objectives(individual, first_individual, self.problem.seed, 'nsga2')
            first_individual = False
            population.append(individual)          

        return population

    #Ordenación de población por dominancia entre soluciones.
    def fast_nondominated_sort(self, population):
        population.fronts = [[]]
        for individual in population:               #Establecimiento mejor frente e info de dominación para generar los demás
            individual.domination_count = 0
            individual.dominated_solutions = []
            for other_individual in population:
                if individual.dominates(other_individual):                  #Si la solución actual domina a la otra
                    individual.dominated_solutions.append(other_individual) #Se añade a su lista de soluciones dominadas
                elif other_individual.dominates(individual):                #Si no
                    individual.domination_count += 1                        #Aumentamos el contador de dominación
            if individual.domination_count == 0:                            #Si no es dominada por nadie
                individual.rank = 0
                population.fronts[0].append(individual)
        i = 0
        while len(population.fronts[i]) > 0:        #Mientras que haya soluciones en el frente actual considerado
            temp = []
            for individual in population.fronts[i]:
                for other_individual in individual.dominated_solutions:     #Para cada individuo dominado por la solución actual
                    other_individual.domination_count -= 1                  #Le quitamos 1 al contador
                    if other_individual.domination_count == 0:              #Si llega a 0 no hay sols que las dominen y entra en el siguiente frente
                        other_individual.rank = i+1
                        temp.append(other_individual)
            i = i+1
            population.fronts.append(temp)


    #Cálculo de la distancia de crowding, DENTRO DE UN MISMO FRENTE.
    def calculate_crowding_distance(self, front):
        if len(front) > 0:
            solutions_num = len(front)
            for individual in front:
                individual.crowding_distance = 0

            for m in range(len(front[0].objectives)):
                front.sort(key=lambda individual: individual.objectives[m])
                front[0].crowding_distance = 10**9
                front[solutions_num-1].crowding_distance = 10**9
                m_values = [individual.objectives[m] for individual in front]
                scale = max(m_values) - min(m_values)
                if scale == 0: scale = 1
                for i in range(1, solutions_num-1):
                    front[i].crowding_distance += (front[i+1].objectives[m] - front[i-1].objectives[m])/scale

    def crowding_operator(self, individual, other_individual):
        if (individual.rank < other_individual.rank) or \
            ((individual.rank == other_individual.rank) and (individual.crowding_distance > other_individual.crowding_distance)):
            return 1
        else:
            return -1

    def create_children(self, population, model):
        first_individual = False
        children = []
        while len(children) < len(population):
            parent1 = self.__tournament(population)
            parent2 = parent1
            while parent1 == parent2:
                parent2 = self.__tournament(population)
            child1, child2 = self.__crossover(parent1, parent2, model)
            prob_mutation_child1 = random.uniform(0,1)
            prob_mutation_child2 = random.uniform(0,1)
            if(prob_mutation_child1 < self.mutation_prob):
                self.__mutate(child1, self.mutation_prob, model)
                child1.creation_mode = "mutation"
            if(prob_mutation_child2 < self.mutation_prob):
                self.__mutate(child2, self.mutation_prob, model)
                child2.creation_mode = "mutation"
            child1.features = decode(self.problem.variables_range, model, **child1.features)
            child2.features = decode(self.problem.variables_range, model, **child2.features)
            self.problem.calculate_objectives(child1, first_individual, self.problem.seed, 'nsga2')
            self.problem.calculate_objectives(child2, first_individual, self.problem.seed, 'nsga2')
            children.append(child1)
            children.append(child2)
        return children

    def __crossover(self, individual1, individual2, model):
        child1 = self.problem.generate_individual()
        child2 = self.problem.generate_individual()
        child1.creation_mode = "crossover"
        child2.creation_mode = "crossover"
        for hyperparameter in child1.features:
            hyperparameter_index = list(child1.features.keys()).index(hyperparameter)
            if self.beta_method == 'uniform':
                beta = self.__get_beta_uniform()
            else:
                beta = self.__get_beta()
            if individual1.features[hyperparameter] is None and individual2.features[hyperparameter] is None:
               child1.features[hyperparameter] = individual1.features[hyperparameter]
               child2.features[hyperparameter] = individual2.features[hyperparameter]
            elif individual1.features[hyperparameter] is None or individual2.features[hyperparameter] is None:
                u = random.random()
                if u <= 0.5:
                    child1.features[hyperparameter] = individual1.features[hyperparameter]
                    child2.features[hyperparameter] = individual2.features[hyperparameter]
                else:
                    child1.features[hyperparameter] = individual2.features[hyperparameter]
                    child2.features[hyperparameter] = individual1.features[hyperparameter]
            else:
                x1 = (individual1.features[hyperparameter] + individual2.features[hyperparameter])/2
                x2 = abs((individual1.features[hyperparameter] - individual2.features[hyperparameter])/2)
                child1.features[hyperparameter] = x1 + beta*x2
                child2.features[hyperparameter] = x1 - beta*x2
                if child1.features[hyperparameter] < self.problem.variables_range[hyperparameter_index][0]:
                   child1.features[hyperparameter] = self.problem.variables_range[hyperparameter_index][0]
                elif child1.features[hyperparameter] > self.problem.variables_range[hyperparameter_index][1]:
                   child1.features[hyperparameter] = self.problem.variables_range[hyperparameter_index][1]
                if child2.features[hyperparameter] < self.problem.variables_range[hyperparameter_index][0]:
                   child2.features[hyperparameter] = self.problem.variables_range[hyperparameter_index][0]
                elif child2.features[hyperparameter] > self.problem.variables_range[hyperparameter_index][1]:
                   child2.features[hyperparameter] = self.problem.variables_range[hyperparameter_index][1]
        child1.features = decode(self.problem.variables_range, model, **child1.features)
        child2.features = decode(self.problem.variables_range, model, **child2.features)
        return child1, child2

    def __get_beta(self):
        u = random.random()
        if u <= 0.5:
            return (2*u)**(1/(self.crossover_param+1))
        return (2*(1-u))**(-1/(self.crossover_param+1))

    def __get_beta_uniform(self):
        u = random.uniform(0, 0.5)
        return u

    def __mutate(self, child, prob_mutation, model):
        hyperparameter = random.choice(list(child.features))
        hyperparameter_index = list(child.features.keys()).index(hyperparameter)
        u, delta = self.__get_delta()
        if child.features[hyperparameter] is not None:
            if u < 0.5:
                child.features[hyperparameter] += delta*(child.features[hyperparameter] - self.problem.variables_range[hyperparameter_index][0])
                child.features = decode(self.problem.variables_range, model, **child.features)
            else:
                child.features[hyperparameter] += delta*(self.problem.variables_range[hyperparameter_index][1] - child.features[hyperparameter])
                child.features = decode(self.problem.variables_range, model, **child.features)
            if child.features[hyperparameter] < self.problem.variables_range[hyperparameter_index][0]:
                child.features[hyperparameter] = self.problem.variables_range[hyperparameter_index][0]
            elif child.features[hyperparameter] > self.problem.variables_range[hyperparameter_index][1]:
                child.features[hyperparameter] = self.problem.variables_range[hyperparameter_index][1]


    def __get_delta(self):
        u = random.random()
        if u <= 0.5:
            return u, (2*u)**(1/(self.mutation_param + 1)) - 1
        return u, 1 - (2*(1-u))**(1/(self.mutation_param + 1))

    def __tournament(self, population):
        participants = random.sample(population.population, self.num_of_tour_particips)
        best = None
        for participant in participants:
            if best is None or (self.crowding_operator(participant, best) == 1 and self.__choose_with_prob(self.tournament_prob)):
                best = participant

        return best

    def __choose_with_prob(self, prob):
        if random.random() <= prob:
            return True
        return False

    def get_maxcomplexity(self,prob):
        return prob.maxcomplexity