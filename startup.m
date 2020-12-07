isOctave = exist('OCTAVE_VERSION', 'builtin') ~= 0;
if ~isOctave
  path(path,'/home/gagarin/Dropbox/dev/matlab')
  cd /home/gagarin/Dropbox/dev/matlab
  startup
else
  cd /home/gagarin/Dropbox/dev/octave
end
clear isOctave;