isOctave = exist('OCTAVE_VERSION', 'builtin') ~= 0;
if ~isOctave
  path(path,'/home/gagarin/Nextcloud/dev/matlab')
  cd /home/gagarin/Nextcloud/dev/matlab
  startup
else
  cd /home/gagarin/Nextcloud/dev/octave
end
clear isOctave;
