function LX --wraps='ssh -Y bbalci@lxplus8.cern.ch' --description 'alias LX8=ssh -Y bbalci@lxplus8.cern.ch'
  ssh -Y -t bbalci@lxplus8.cern.ch $argv; 
end
