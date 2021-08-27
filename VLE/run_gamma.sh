# Local:  ./run_gamma.sh --data_path . --checkpoint_frzn model.pt  --experiment_name cosmo-gammas-pretrained
# Grid: grid run --use_spot --localdir --instance_type p2.xlarge run_gamma.sh --data_path grid:cosmo-gammas:1 --checkpoint_frzn model.pt  --experiment_name cosmo_gammas_pretrained

# grid run --use_spot --localdir --instance_type p2.xlarge run_gamma.sh --data_path grid:cosmo-gammas:1 --checkpoint_path model.pt  --experiment_name cosmo_gammas_pretrained_continue

#### Login into wandb
wandb login 


python cross_validate.py $1 $2 --data_path train_cosmo_data.csv --features_path train_cosmo_features.csv --separate_test_path test_data.csv --separate_test_features_path test_all_features.csv --separate_val_path val_data.csv --separate_val_features_path val_all_features.csv --dataset_type regression --save_preds --smiles_columns "smiles_1" "smiles_2" --target_columns "ln_gamma_1" "ln_gamma_2" --number_of_molecules 2 --cache_cutoff 1e9 --batch_size 100 --epochs 30 --extra_metrics r2 mae --mpn_shared $5 $6
