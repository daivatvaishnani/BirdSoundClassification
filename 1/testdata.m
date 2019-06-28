clear variables;
clc;

import matlab.net.*
import matlab.net.http.*

species = ["house_sparrow",
           "house_finch",
           "common_blackbird",
           "common_cuckoo",
           "little_egret"];       

no_features = 50;

% for s = 1:length(species)
%     
%     api_endpoint = 'https://www.xeno-canto.org/api/2/recordings';
%     
%     uri = strcat(api_endpoint, '?query=', species(s), '+q:A');
% 
%     disp(uri);
%     request = RequestMessage;
% 
%     resp = send(request, uri);
% 
%     recs = resp.Body.Data.recordings;
% 
%     nrecs = min(10, length(recs));
% 
%     for i = 1:nrecs
%         dlink = recs(i).file;
%         dlink = strcat('https:', dlink);
%         name = strcat(species(s),num2str(i));
%         name = strcat(name,'.mp3');
%         bird = websave(name, dlink);
%     end
% end

data = construct_dataset(species, no_features);


