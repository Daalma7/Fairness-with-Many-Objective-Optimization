#File execution

python fairness.py nind=50 ngen=50 alg=nsga2 dat=adult var=race bseed=30 nruns=3 model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &

python fairness.py nind=50 ngen=50 alg=smsemoa dat=adult var=race bseed=30 nruns=3 model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &

python fairness.py nind=50 ngen=50 alg=grea dat=adult var=race bseed=30 nruns=3 model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &


wait

python totalpo.py alg=nsga2,smsemoa,grea dat=adult var=race model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &

wait
#python calculatemeasures.py alg=nsga2 dat=adult var=race model=DT obj=gmean_inv,dem_fpr extra=dem_ppv,num_leaves &
python calculatemeasures.py alg=nsga2,smsemoa,grea dat=adult var=race model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &
