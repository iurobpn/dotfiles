isOctave = exist('OCTAVE_VERSION', 'builtin') ~= 0;
if ~isOctave
  path(path,'/home/gagarin/git/matlab-dev')
  cd /home/gagarin/git/matlab-dev
  startup
else
  cd /home/gagarin/Nextcloud/dev/octave
end
clear isOctave;
