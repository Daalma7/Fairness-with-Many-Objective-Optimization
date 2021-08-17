
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
python calculatemeasures.py alg=nsga2,smsemoa,grea dat=ricci var=Race model=DT obj=gmean_inv,dem_fpr,dem_ppv,num_leaves &

wait

python totalpo.py alg=nsga2,smsemoa,grea dat=adult var=race model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
#python totalpo.py alg=nsga2 dat=adult var=race model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &
python totalpo.py alg=nsga2,smsemoa,grea dat=german var=age model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
#python totalpo.py alg=nsga2 dat=german var=age model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &
python totalpo.py alg=nsga2,smsemoa,grea dat=propublica_recidivism var=race model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
#python totalpo.py alg=nsga2 dat=propublica_recidivism var=race model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &
python totalpo.py alg=nsga2,smsemoa,grea dat=propublica_violent_recidivism var=race model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
#python totalpo.py alg=nsga2 dat=propublica_violent_recidivism var=race model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &
python totalpo.py alg=nsga2,smsemoa,grea dat=ricci var=Race model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
#python totalpo.py alg=nsga2,smsemoa,grea dat=ricci var=Race model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &


wait
#python calculatemeasures.py alg=nsga2 dat=adult var=race model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &
python calculatemeasures.py alg=nsga2,smsemoa,grea dat=adult var=race model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
#python calculatemeasures.py alg=nsga2 dat=german var=age model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &
python calculatemeasures.py alg=nsga2,smsemoa,grea dat=german var=age model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
#python calculatemeasures.py alg=nsga2 dat=propublica_recidivism var=race model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &
python calculatemeasures.py alg=nsga2,smsemoa,grea dat=propublica_recidivism var=race model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
#python calculatemeasures.py alg=nsga2 dat=propublica_violent_recidivism var=race model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &
python calculatemeasures.py alg=nsga2,smsemoa,grea dat=propublica_violent_recidivism var=race model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &
#python calculatemeasures.py alg=nsga2 dat=ricci var=Race model=LR obj=gmean_inv,dem_fpr extra=dem_ppv,dem_pnr &
python calculatemeasures.py alg=nsga2,smsemoa,grea dat=ricci var=Race model=LR obj=gmean_inv,dem_fpr,dem_ppv,dem_pnr &

