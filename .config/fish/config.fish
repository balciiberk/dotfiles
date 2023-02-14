if status is-interactive
    fish_vi_key_bindings
    bind p fish_clipboard_paste
    bind yy fish_clipboard_copy
    bind Y fish_clipboard_copy
    # Commands to run in interactive sessions can go here
end

kubectl completion fish | source
