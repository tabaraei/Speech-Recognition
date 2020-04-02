function index = autoIndex(directory, label, root)

path = [root, '\Recordings\', directory, '\', label, '*.wav'];
audios = dir(path);
index = num2str(length(audios)+1);

end