cmsrel CMSSW_11_0_1
cd CMSSW_11_0_1/src
cmsenv

git-cms-init
git-cms-addpkg GeneratorInterface/RivetInterface
git-cms-addpkg Configuration/Generator

curl -s https://raw.githubusercontent.com/cms-sw/genproductions/master/genfragments/ThirteenTeV/MinBias_TuneCP5_13TeV_pythia8_cff.py -o Configuration/GenProduction/python/ThirteenTeV/MinBias_TuneCP5_13TeV_pythia8_cff.py --create-dirs

curl -s https://raw.githubusercontent.com/cms-sw/genproductions/UL2019/python/rivet_customize.py -o Configuration/GenProduction/python/rivet_customize.py
cp ~/private/study/mc2/CMSSW_12_4_3/src/Configuration/GenProduction/python/rivet_customize.py Configuration/GenProduction/python/rivet_customize.py
#sed -i '/process.rivetAnalyzer.AnalysisNames/d' Configuration/GenProduction/python/rivet_customize.py
#sed -i "6i\ 	process.rivetAnalyzer.AnalysisNames = cms.vstring(\'CMS_2021_I1932460\')" Configuration/GenProduction/python/rivet_customize.py

echo "pT0Ref 1.0 4.6" >> generator.ranges
echo "coreFraction 0.1 0.95" >> generator.ranges
echo "coreRadius 0.1 0.8" >> generator.ranges

cmsenv

cmsDriver.py Configuration/GenProduction/python/ThirteenTeV/MinBias_TuneCP5_13TeV_pythia8_cff.py -s GEN --datatier=GEN-SIM-RAW --conditions auto:mc --eventcontent RAWSIM --no_exec -n 10000 --python_filename=rivet_cfg.py --customise=Configuration/GenProduction/rivet_customize.py

sed -i 's/MultipartonInteractions:pT0Ref=1.41/MultipartonInteractions:pT0Ref={pT0Ref}/' rivet_cfg.py
sed -i 's/MultipartonInteractions:coreRadius=0.7634/MultipartonInteractions:coreRadius={coreRadius}/' rivet_cfg.py
sed -i 's/MultipartonInteractions:coreFraction=0.63/MultipartonInteractions:coreFraction={coreFraction}/' rivet_cfg.py
sed -i '/SLHA:keepSM/d' rivet_cfg.py
sed -i '31i process.MessageLogger.cerr.FwkReport.reportEvery = cms.untracked.int32(1000)' rivet_cfg.py

mkdir mcruns

prof2-sample generator.ranges -n 20 -o mcruns/ -t rivet_cfg.py
