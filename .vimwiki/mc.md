[script_11](script_11)
[script_12](script_12)
[crab](crab)
[sunum](sunum)
13_TeV

prof2-sample -o mcruns -n 50 -t crabConfig-13TeV.py -t crabConfig-7TeV.py -t Tune_13TeV_cfg.py -t Tune_7TeV_cfg.py generator.ranges
prof2-sample -o mcruns -n 70 -t crabConfig-13TeV.py -t crabConfig-7TeV.py -t Tune_13TeV_cfg.py -t Tune_7TeV_cfg.py generator.ranges

prof2-tune -d data/ ipol.dat -r mcruns --wfile=weights.txt


#7 TeV
cmsDriver.py Configuration/GenProduction/python/SevenTeV/MinBias_TuneCP5-DPS_7TeV_pythia8_cff.py -s GEN --datatier=GEN-SIM-RAW --conditions auto:mc --eventcontent RAWSIM --no_exec -n 10000 --python_filename=rivet_7_cfg.py --customise=Configuration/GenProduction/rivet_customize_7.py

 rm Rivet/GEN/src/MC_PHOTONS.cc
 rm Rivet/TOP/src/CMS_2016_PAS_TOP_15_006.cc
 rm Rivet/TOP/src/CMS_2016_I1491950.cc
 rm Rivet/SMP/src/CMS_2019_I1753680.cc
 rm Rivet/SMP/src/CMS_2019_I1705068.cc

CMS_2021_I1932460 CMS: Measurement of double-parton scattering in inclusive production of four jets with low transverse momentum in proton-proton collisions at √s = 13 TeV

[bbalci@lxplus766 src]$ vim /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/professor2/2.3.3-ad27d4490c9970dc7d2c8df2b5a83a2b/lib/python3.9/site-packages/professor2/professor2/


LX 12_4_3'te submit calisiyor
LX 11_0_1'de prof calisiyor
7_mc 1000 event * 35 dif params runned

# 13_TeV
CMS_2021_I1866118
CMS_2021_I1932460

