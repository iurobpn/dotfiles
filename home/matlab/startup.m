path(path,'/home/gagarin/git/matlab-dev')

isOctave = exist('OCTAVE_VERSION', 'builtin') ~= 0;
cd /home/gagarin/git/matlab-dev
if ~isOctave
    startup
else
    startup_octave
end
clear isOctave;
