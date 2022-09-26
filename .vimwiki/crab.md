cmsenv
source /cvmfs/cms.cern.ch/common/crab-setup.sh
voms-proxy-init -voms cms -rfc  -valid 192:00

crab submit --config=crabConfig.py


crab submit --config=crabConfig-CP5-13_TeV_coreFraction_max.py
crab submit --config=crabConfig-CP5-13_TeV_coreFraction_min.py
crab submit --config=crabConfig-CP5-13_TeV_coreRadius_max.py
crab submit --config=crabConfig-CP5-13_TeV_coreRadius_min.py
crab submit --config=crabConfig-CP5-13_TeV_pT0Ref_max.py
crab submit --config=crabConfig-CP5-13_TeV_pT0Ref_min.py
