cmsrel CMSSW_12_4_3
cd CMSSW_12_4_3/src
cmsenv

git-cms-init
git-cms-addpkg GeneratorInterface/RivetInterface
git-cms-addpkg Configuration/Generator
#git clone ssh://git@gitlab.cern.ch:7999/${USER}/Rivet.git
git clone ssh://git@gitlab.cern.ch:7999/cms-gen/Rivet.git
git remote add cms-gen ssh://git@gitlab.cern.ch:7999/cms-gen/Rivet.git
source Rivet/rivetSetup.sh
scram b -j8

curl -s https://raw.githubusercontent.com/cms-sw/genproductions/master/genfragments/ThirteenTeV/MinBias_TuneCP5_13TeV_pythia8_cff.py -o Configuration/GenProduction/python/ThirteenTeV/MinBias_TuneCP5_13TeV_pythia8_cff.py --create-dirs

curl -s https://raw.githubusercontent.com/cms-sw/genproductions/UL2019/python/rivet_customize.py -o Configuration/GenProduction/python/rivet_customize.py
cp ~/private/study/mc2/CMSSW_12_4_3/src/Configuration/GenProduction/python/rivet_customize.py Configuration/GenProduction/python/rivet_customize.py

scram b -j8

sed -i 's/MultipartonInteractions:pT0Ref=1.41/MultipartonInteractions:pT0Ref={pT0Ref}/' rivet_cfg.py
sed -i 's/MultipartonInteractions:coreRadius=0.7634/MultipartonInteractions:coreRadius={coreRadius}/' rivet_cfg.py
sed -i 's/MultipartonInteractions:coreFraction=0.63/MultipartonInteractions:coreFraction={coreFraction}/' rivet_cfg.py
sed -i '/SLHA:keepSM/d' rivet_cfg.py
sed -i '31i process.MessageLogger.cerr.FwkReport.reportEvery = cms.untracked.int32(1000)' rivet_cfg.py

echo "pT0Ref 1.0 4.6" >> generator.ranges
echo "coreFraction 0.1 0.95" >> generator.ranges
echo "coreRadius 0.1 0.8" >> generator.ranges

cp ~/private/study/mc2/CMSSW_12_4_3/src/submit.py .

cmsenv

cp -r ../../CMSSW_11_0_1/src/mcruns mcruns3

./submit.py --runs 0-149  --directory mcruns2 -c  rivet_7_cfg.py
