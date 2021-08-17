import pandas as pd
from math import ceil
import random
import csv
import sys
import warnings
import importlib
import os
import re
import numpy as np
from collections import OrderedDict as od
warnings.filterwarnings("ignore")

sys.path.append("..")
from general.ml import *
from general.individual import *
from general.problem import Problem
from algorithms.nsga2.utils import NSGA2Utils
from general.population import Population
from general.ml import *


alg = dat = var = obj = mod = False        #Possible parameters given
#objectives_results_dict = {'gmean_inv': 'error_val', 'dem_fpr': 'dem_fpr_val', 'dem_ppv': 'dem_ppv_val', 'dem_pnr': 'dem_pnr_val'}
objectives_results_dict = {'gmean_inv': 'error', 'dem_fpr': 'dem_fp', 'dem_ppv': 'dem_ppv', 'dem_pnr': 'dem_pnr'}
objectives_results_norm_dict = {'num_leaves': 'num_leaves', 'data_weight_avg_depth': 'data_weight_avg_depth'}
variables_range = [(20, 200),(0.0001, 0.1), (0.001, 100000), (0, 1), (1, 9)]
strobj = "gmean_inv__dem_fpr__dem_ppv__dem_pnr"
strextra = ""
objectives = [gmean_inv, dem_fpr,dem_ppv, dem_pnr]
extraobj = []

obj
extra = ""

for alg in ["nsga2", "smsemoa", "grea"]:
    for data in ["adult", "german", "propublica_recidivism", "propublica_violent_recidivism", "ricci"]:
        if data == "adult" or data == "propublica_recidivism" or data == "propublica_violent_recidivism":
            var = "race"
        if data == "ricci":
            var = "Race"
        if data == "german":
            var = "age"
        
        pareto_fronts=[]
        all_indivs = []
        pareto_optimal =[]

        for seed in range(100, 110):
            read = pd.read_csv('../results/' + alg + '/individuals/individuals_' + data + '_seed_' + str(seed) + '_var_' + var + '_gen_300_indiv_150_model_LR_obj_' + strobj + strextra + '.csv')
            pareto_fronts.append(read)

            pareto_fronts = pd.concat(pareto_fronts)                            #Union of all pareto fronts got in each run
            pareto_fronts.reset_index(drop=True, inplace=True)                  #Reset index because for each run all rows have repeated ones
            for index, row in pareto_fronts.iterrows():                         #We create an individual object associated with each row
                indiv = IndividualLR()
                hyperparameters = ['max_iter', 'tol', 'lambda', 'l1_ratio', 'class_weight']
                indiv.features = [row[x] for x in hyperparameters]
                indiv.id = row['id']
                indiv.domination_count = 0
                indiv.features = od(zip(hyperparameters, indiv.features))
                indiv.objectives = []
                for x in objectives:
                    # We will insert all objectives, normalizing every objective that should be
                    obj = objectives_results_dict.get(x.__name__, "None")
                    if not obj == "None":                   #The objective doesn't need to be normalized to the range [0,1]
                        indiv.objectives.append(float(row[obj]))
                    else:                                   #In other case
                        obj = objectives_results_norm_dict.get(x.__name__)
                        indiv.objectives.append(float(row[obj]) / pareto_fronts[obj].max())
                #The same with extra objectives
                indiv.extra = []
                if not extraobj == None: 
                    for x in extraobj:
                        # We will insert all objectives, normalizing every objective that should be
                        ext = objectives_results_dict.get(x.__name__, "None")
                        if not ext == "None":                   #The objective doesn't need to be normalized to the range [0,1]
                            indiv.extra.append(float(row[ext]))
                        else:                                   #In other case
                            ext = objectives_results_norm_dict.get(x.__name__)
                            indiv.extra.append(float(row[ext]) / pareto_fronts[ext].max())
                indiv.creation_mode = row['creation_mode']
                all_indivs.append(indiv)

            print(len(all_indivs))
            for indiv in all_indivs:                       #Now we calculate all the individuals non dominated by any other (pareto front)
                print()
                print(i)
                for other_indiv in all_indivs:
                    if other_indiv.dominates(indiv):                
                        indiv.domination_count += 1                        #Indiv is dominated by the second
                if indiv.domination_count < 10:                            #Could be done easily more efficiently, but could be interesting 
                    pareto_optimal.append(indiv)
            pareto_optimal_df = []
            for p in pareto_optimal:                #We select individuals from the files corresponding to the pareto front ones (we filter by id)
                curr_id = p.id                      #BUT IF THERE ARE MORE THAN 1 INDIVIDUAL WITH THE SAME ID THEY WILL ALL BE ADDED, EVEN THOUGHT ONLY 1 OF THEM IS A PARETO OPTIMAL SOLUTION
                found = False                       #Which is by the way really unlikely since there are 36^10 possibilities for an id
                for index, row in pareto_fronts.iterrows():
                    if row['id'] == curr_id:
                        pareto_optimal_df.append(pd.DataFrame({x : row[x] for x in pareto_fronts.columns.tolist()}, index=[0])) #We introduce here the not-normalized version of them
                        found = True
                if not found:
                    pareto_optimal.remove(p)
            #We extract them to a file
            pareto_optimal_df = pd.concat(pareto_optimal_df)

            pareto_optimal_df.drop_duplicates(subset=(['seed']+hyperparameters), keep='first').dropna()

            pareto_optimal_df.to_csv('../results/' + alg + '/individuals/general_individuals_pareto_' + data + '_baseseed_100_nruns_10_var_' + var + '_gen_300_indiv_150_model_LR_obj_' + strobj + strextra + '.csv', index = False, header = True, columns = list(pareto_fronts.keys()))

            print("----")