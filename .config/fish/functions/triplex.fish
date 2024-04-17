function triplex
  if not set -q DISPLAY
    startx -c /home/berk/.xinitrc 
  else
    xrandr --output DP-1-8 --auto --pos 1920x0 --rotate normal --output DP-1-1 --auto  --pos 4480x0 --rotate normal --output eDP-1 --mode 1920x1200 --pos 0x240 --rotate normal
  end 
end
