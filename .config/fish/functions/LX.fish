function LX --wraps='ssh -Y bbalci@lxplus.cern.ch' --description 'alias LX=ssh -Y bbalci@lxplus.cern.ch'
  ssh -Y bbalci@lxplus.cern.ch $argv; 
end
