#File execution

python preprocess.py
:'
#NSGA-II executions
#python fairness.py nind=150 ngen=300 alg=nsga2 dat=adult var=race bseed=100 nruns=10 model=DT obj=gmean_inv,dem_fpr extra=dem_ppv,num_leaves &
#python fairness.py nind=150 ngen=300 alg=nsga2 dat=german var=age bseed=100 nruns=10 model=DT obj=gmean_inv,dem_fpr extra=dem_ppv,num_leaves &
#python fairness.py nind=150 ngen=300 alg=nsga2 dat=propublica_recidivism var=race bseed=100 nruns=10 model=DT obj=gmean_inv,dem_fpr extra=dem_ppv,num_leaves &
#python fairness.py nind=150 ngen=300 alg=nsga2 dat=propublica_violent_recidivism var=race bseed=100 nruns=10 model=DT obj=gmean_inv,dem_fpr extra=dem_ppv,num_leaves &
#python fairness.py nind=150 ngen=300 alg=nsga2 dat=ricci var=Race bseed=100 nruns=10 model=DT obj=gmean_inv,dem_fpr extra=dem_ppv,num_leaves &


python fairness.py nind=150 ngen=300 alg=nsga2 dat=adult var=race bseed=100 nruns=10 model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
sleep 1
python fairness.py nind=150 ngen=300 alg=nsga2 dat=german var=age bseed=100 nruns=10 model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
sleep 1
python fairness.py nind=150 ngen=300 alg=nsga2 dat=propublica_recidivism var=race bseed=100 nruns=10 model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
sleep 1
python fairness.py nind=150 ngen=300 alg=nsga2 dat=propublica_violent_recidivism var=race bseed=100 nruns=10 model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
sleep 1
python fairness.py nind=150 ngen=300 alg=nsga2 dat=ricci var=Race bseed=100 nruns=10 model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
sleep 1

wait

#SMS-EMOA executions

python fairness.py nind=150 ngen=300 alg=smsemoa dat=adult var=race bseed=100 nruns=10 model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
sleep 1
python fairness.py nind=150 ngen=300 alg=smsemoa dat=german var=age bseed=100 nruns=10 model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
sleep 1
python fairness.py nind=150 ngen=300 alg=smsemoa dat=propublica_recidivism var=race bseed=100 nruns=10 model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
sleep 1
python fairness.py nind=150 ngen=300 alg=smsemoa dat=propublica_violent_recidivism var=race bseed=100 nruns=10 model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
sleep 1
python fairness.py nind=150 ngen=300 alg=smsemoa dat=ricci var=Race bseed=100 nruns=10 model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
sleep 1

wait


python fairness.py nind=150 ngen=300 alg=grea dat=adult var=race bseed=100 nruns=10 model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
sleep 1
python fairness.py nind=150 ngen=300 alg=grea dat=german var=age bseed=100 nruns=10 model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
sleep 1
python fairness.py nind=150 ngen=300 alg=grea dat=propublica_recidivism var=race bseed=100 nruns=10 model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
sleep 1
python fairness.py nind=150 ngen=300 alg=grea dat=propublica_violent_recidivism var=race bseed=100 nruns=10 model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
sleep 1
python fairness.py nind=150 ngen=300 alg=grea dat=ricci var=Race bseed=100 nruns=10 model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
sleep 1

wait
'

:'
python totalpo.py alg=nsga2,smsemoa,grea dat=adult var=race model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
#python totalpo.py alg=nsga2 dat=adult var=race model=DT obj=gmean_inv,dem_fpr extra=dem_ppv,num_leaves &
python totalpo.py alg=nsga2,smsemoa,grea dat=german var=age model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
#python totalpo.py alg=nsga2,smsemoa,grea dat=german var=age model=DT obj=gmean_inv,dem_fpr extra=dem_ppv,num_leaves &
python totalpo.py alg=nsga2,smsemoa,grea dat=propublica_recidivism var=race model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
#python totalpo.py alg=nsga2,smsemoa,grea dat=propublica_recidivism var=race model=DT obj=gmean_inv,dem_fpr extra=dem_ppv,num_leaves &
python totalpo.py alg=nsga2,smsemoa,grea dat=propublica_violent_recidivism var=race model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
#python totalpo.py alg=nsga2 dat=propublica_violent_recidivism var=race model=DT obj=gmean_inv,dem_fpr extra=dem_ppv,num_leaves &
python totalpo.py alg=nsga2,smsemoa,grea dat=ricci var=Race model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
#python totalpo.py alg=nsga2,smsemoa,grea dat=ricci var=Race model=DT obj=gmean_inv,dem_fpr extra=dem_ppv,num_leaves &

wait
#python calculatemeasures.py alg=nsga2 dat=adult var=race model=DT obj=gmean_inv,dem_fpr extra=dem_ppv,num_leaves &
python calculatemeasures.py alg=nsga2,smsemoa,grea dat=adult var=race model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
#python calculatemeasures.py alg=nsga2 dat=german var=age model=DT obj=gmean_inv,dem_fpr extra=dem_ppv,num_leaves &
python calculatemeasures.py alg=nsga2,smsemoa,grea dat=german var=age model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
#python calculatemeasures.py alg=nsga2 dat=propublica_recidivism var=race model=DT obj=gmean_inv,dem_fpr extra=dem_ppv,num_leaves &
python calculatemeasures.py alg=nsga2,smsemoa,grea dat=propublica_recidivism var=race model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
#python calculatemeasures.py alg=nsga2 dat=propublica_violent_recidivism var=race model=DT obj=gmean_inv,dem_fpr extra=dem_ppv,num_leaves &
python calculatemeasures.py alg=nsga2,smsemoa,grea dat=propublica_violent_recidivism var=race model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
#python calculatemeasures.py alg=nsga2 dat=ricci var=Race model=DT obj=gmean_inv,dem_fpr extra=dem_ppv,num_leaves &

python calculatemeasures.py alg=nsga2,smsemoa,grea dat=ricci var=Race model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves

python plots_2.py alg=nsga2,smsemoa,grea dat=adult var=race model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves
python plots_2.py alg=nsga2,smsemoa,grea dat=german var=age model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves
python plots_2.py alg=nsga2,smsemoa,grea dat=propublica_recidivism var=race model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves
python plots_2.py alg=nsga2,smsemoa,grea dat=propublica_violent_recidivism var=race model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves
python plots_2.py alg=nsga2,smsemoa,grea dat=ricci var=Race model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves
'

#LOGISTIC REGRESSION

#adult dataset with Decision Trees

python fairness.py nind=150 ngen=300 alg=nsga2 dat=adult var=race bseed=100 nruns=10 model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &
sleep 1
python fairness.py nind=150 ngen=300 alg=nsga2 dat=german var=age bseed=100 nruns=10 model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &
sleep 1
python fairness.py nind=150 ngen=300 alg=nsga2 dat=propublica_recidivism var=race bseed=100 nruns=10 model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &
sleep 1
python fairness.py nind=150 ngen=300 alg=nsga2 dat=propublica_violent_recidivism var=race bseed=100 nruns=10 model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &
sleep 1
python fairness.py nind=150 ngen=300 alg=nsga2 dat=ricci var=Race bseed=100 nruns=10 model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &
sleep 1


python fairness.py nind=150 ngen=300 alg=nsga2 dat=adult var=race bseed=100 nruns=10 model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
sleep 1
python fairness.py nind=150 ngen=300 alg=nsga2 dat=german var=age bseed=100 nruns=10 model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
sleep 1
python fairness.py nind=150 ngen=300 alg=nsga2 dat=propublica_recidivism var=race bseed=100 nruns=10 model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
sleep 1
python fairness.py nind=150 ngen=300 alg=nsga2 dat=propublica_violent_recidivism var=race bseed=100 nruns=10 model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
sleep 1
python fairness.py nind=150 ngen=300 alg=nsga2 dat=ricci var=Race bseed=100 nruns=10 model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
sleep 1

#german dataset with Logistic Regression
python fairness.py nind=150 ngen=300 alg=smsemoa dat=adult var=race bseed=100 nruns=10 model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
sleep 1
python fairness.py nind=150 ngen=300 alg=smsemoa dat=german var=age bseed=100 nruns=10 model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
sleep 1
python fairness.py nind=150 ngen=300 alg=smsemoa dat=propublica_recidivism var=race bseed=100 nruns=10 model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
sleep 1
python fairness.py nind=150 ngen=300 alg=smsemoa dat=propublica_violent_recidivism var=race bseed=100 nruns=10 model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
sleep 1
python fairness.py nind=150 ngen=300 alg=smsemoa dat=ricci var=Race bseed=100 nruns=10 model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
sleep 1

#propublica_recidivism dataset with Logistic Regression

python fairness.py nind=150 ngen=300 alg=grea dat=adult var=race bseed=100 nruns=10 model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
sleep 1
python fairness.py nind=150 ngen=300 alg=grea dat=german var=age bseed=100 nruns=10 model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
sleep 1
python fairness.py nind=150 ngen=300 alg=grea dat=propublica_recidivism var=race bseed=100 nruns=10 model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
sleep 1
python fairness.py nind=150 ngen=300 alg=grea dat=propublica_violent_recidivism var=race bseed=100 nruns=10 model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
sleep 1
python fairness.py nind=150 ngen=300 alg=grea dat=ricci var=Race bseed=100 nruns=10 model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
sleep 1

wait


python totalpo.py alg=nsga2,smsemoa,grea dat=adult var=race model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
python totalpo.py alg=nsga2 dat=adult var=race model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &
python totalpo.py alg=nsga2,smsemoa,grea dat=german var=age model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
python totalpo.py alg=nsga2 dat=german var=age model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &
python totalpo.py alg=nsga2,smsemoa,grea dat=propublica_recidivism var=race model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
python totalpo.py alg=nsga2 dat=propublica_recidivism var=race model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &
python totalpo.py alg=nsga2,smsemoa,grea dat=propublica_violent_recidivism var=race model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
python totalpo.py alg=nsga2 dat=propublica_violent_recidivism var=race model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &
python totalpo.py alg=nsga2,smsemoa,grea dat=ricci var=Race model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
python totalpo.py alg=nsga2,smsemoa,grea dat=ricci var=Race model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &


wait
python calculatemeasures.py alg=nsga2 dat=adult var=race model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &
python calculatemeasures.py alg=nsga2,smsemoa,grea dat=adult var=race model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
python calculatemeasures.py alg=nsga2 dat=german var=age model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &
python calculatemeasures.py alg=nsga2,smsemoa,grea dat=german var=age model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
python calculatemeasures.py alg=nsga2 dat=propublica_recidivism var=race model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &
python calculatemeasures.py alg=nsga2,smsemoa,grea dat=propublica_recidivism var=race model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
python calculatemeasures.py alg=nsga2 dat=propublica_violent_recidivism var=race model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &
python calculatemeasures.py alg=nsga2,smsemoa,grea dat=propublica_violent_recidivism var=race model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
python calculatemeasures.py alg=nsga2 dat=ricci var=Race model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &
python calculatemeasures.py alg=nsga2,smsemoa,grea dat=ricci var=Race model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
'