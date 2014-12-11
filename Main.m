function varargout = Main(varargin)
% MAIN M-file for Main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Main

% Last Modified by GUIDE v2.5 21-Nov-2014 16:00:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Main_OpeningFcn, ...
                   'gui_OutputFcn',  @Main_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

% Initialize Experimental Condition
% End initialization code - DO NOT EDIT


% --- Executes just before Main is made visible.
function Main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Main (see VARARGIN)

% Choose default command line output for Main
handles.output = hObject;

%% Verify first access and Update handles structure
guidata(hObject, handles);
varControl = get(handles.t_control_in, 'String');

if strcmp(varControl,'no') ~= 0
    initialize_gui(hObject, eventdata, handles);
else
    %retrives the global variable saved in ins_data 
    GlobDat = getappdata(0,'varGlobal');  
    [hObject, eventdata, handles] = update_gui(hObject, eventdata, handles,GlobDat);
    rmappdata(0,'varGlobal');
end


% UIWAIT makes Main wait for user response (see UIRESUME)
% uiwait(handles.Main);

% --- Outputs from this function are returned to the command line.
function varargout = Main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function initialize_gui(hObject, eventdata, handles)
%%  Inizialize the variables and set the text to defaul value
    
    set(handles.text_eler,'String',num2str(64));
    handles.data.ele_r = 64;
    
    set(handles.text_elec,'String',num2str(64));
    handles.data.ele_c = 64;
    
    set(handles.text_phr,'String',handles.data.ele_r);
    handles.data.phos_r = handles.data.ele_r;
    
    set(handles.text_phc,'String',handles.data.ele_c);
    handles.data.phos_c = handles.data.ele_c;
    
    set(handles.text_distance,'String',num2str(10));
    handles.data.distance = 10;
    
    set(handles.text_profile,'String','Circle');
    handles.data.profile = 'Circle';
    
    set(handles.text_sp,'String',num2str(10));
    handles.data.r_space = 10;
    
    set(handles.text_tr,'String',num2str(10));
    handles.data.r_time = 10;
    
    set(handles.text_mpr,'String','Voltage');
    handles.data.mod_prot = 'Voltage';
    
    set(handles.text_mph,'String','Amplitude');
    handles.data.mod_phos = 'Amplitude';
    
    set(handles.text_ty,'String','Uniform');
    handles.data.type_map = 'Uniform';
    
    set(handles.text_RendRow,'String','Default');
    handles.data.RendRow = 'Default';
    
    set(handles.text_RendCol,'String','Default');
    handles.data.RendCol = 'Default';
    
    guidata(hObject,handles);
    
    
 
function [hObject, eventdata, handles] = update_gui(hObject, eventdata, handles,NewData)
%% Update the new value on static text

    %Set new value of num electrode column 
    handles.data.ele_c = NewData.ele_c;
    handles.data.phos_c = handles.data.ele_c;
    set(handles.text_phc,'String',handles.data.phos_c);
    set(handles.text_elec,'String',handles.data.ele_c);
    
    %Set new value of num electrode row
    handles.data.ele_r = NewData.ele_r;
    handles.data.phos_r = handles.data.ele_r;
    set(handles.text_phr,'String',handles.data.phos_r);
    set(handles.text_eler,'String',handles.data.ele_r);
    
    %Set new value of space response
    handles.data.r_space = NewData.r_space;
    set(handles.text_sp,'String',handles.data.r_space);
    
    %Set new value of dimension electrode
    handles.data.distance = NewData.distance; %um
    set(handles.text_distance,'String',handles.data.distance);
    
    %Set new value of time response
    handles.data.r_time = NewData.r_time;
    set(handles.text_tr,'String',handles.data.r_time);
    
    %Set new value to row and column of phosfenes in New Design
    handles.data.RendCol = NewData.RendCol;
    handles.data.RendRow = NewData.RendRow;
    set(handles.text_RendCol,'String',handles.data.RendCol);
    set(handles.text_RendRow,'String',handles.data.RendRow);
    
    %Set new value of modulation prothesis
    handles.data.mod_prot = NewData.mod_prot;
    set(handles.text_mpr,'String',handles.data.mod_prot);
    
    %Set new value of type map
    handles.data.type_map = NewData.type_map;
    set(handles.text_ty,'String',handles.data.type_map);
    
    %Set new value of modulation phosphenes
    handles.data.mod_phos = NewData.mod_phos;
    set(handles.text_mph,'String',handles.data.mod_phos);
    
    %Set new value of profile electrode
    handles.data.profile = NewData.profile;
    set(handles.text_profile,'String',handles.data.profile);
    
    guidata(hObject,handles); %% Save the modifications 
    
    
    
% --- Executes on button press in Play.
function Play_Callback(hObject, eventdata, handles)

    path_old = cd(handles.PathNameVid);
    if not(exist('vid')) 
       vid = vision.VideoFileReader(handles.FileNameVid,'ImageColorSpace','Intensity', 'VideoOutputDataType', 'double' );
    end
    cd(path_old);
    
    %% Get same input data parameters
    %nof =                                  %number of frame for the overall video
    vidHeight = vid.info.VideoSize(2);      %Height video
    vidWidth = vid.info.VideoSize(1);       %Width video
    vidFrate = vid.info.VideoFrameRate;     %Number of frame for second
    vidFormat = vid.info.VideoFormat;       %Format of Video 
    
    %% Calculating the number of pixel for each phosfene
    pixph_c = vidWidth/handles.data.phos_c;  
    pixph_r = vidHeight/handles.data.phos_r;
    
      %% Verify rendering not uniform
    if (strcmp(handles.data.RendRow,'Default')==1)
        handles.data.ty_render = 'Default';
        RendRow2 = yIm;
        RendCol2 = xIm;
    else
        handles.data.ty_render = 'Design Not Uniform';
        RendRow2 = handles.data.RendRow;
        RendCol2 = handles.data.RendCol;
    end
    
    %% Insert the variables in the box to pass in the function
    box_margin{1} = handles.data.phos_r;
    box_margin{2} = handles.data.phos_c;  
    box_margin{3} = pixph_r;
    box_margin{4} = pixph_c;

%% http://it.mathworks.com/help/vision/functionlist.html
%  da consultare per tutte le funzionalità della computer vision di Matlab
%%    
    videoPlayerLEFT = vision.VideoPlayer;
    videoPlayerRIGHT = vision.VideoPlayer;              
%             viewReal = vision.DeployableVideoPlayer;
%             viewPhosf = vision.DeployableVideoPlayer;
      
    handles.vid_pause = 1;
    handles.vid_stop = 1;
    
 %   while handles.vid_stop == 1
        while ~isDone(vid) 
  %          while handles.vid_pause ==1
                %loop for wait the push play
   %         end
            
            frame = step(vid);
%           Display input video frame on axis
%               step(viewReal,frame)               
            step(videoPlayerLEFT,frame)
%               showFrameOnAxis(handles.axesReal, frame);

               
            [FrameModified] = spvmain2(frame,handles.data.type_map,...
                              handles.data.mod_phos,box_margin,...
                              handles.data.distance,handles.data.ty_render,...
                              RendRow2,RendCol2);     
                              
%           Display Phosfened video from on axis
             step(videoPlayerRIGHT,FrameModified)
%               step(viewPhosf,FrameModified)
%               showFrameOnAxis(handles.axesPhosfened, FrameModified);
        end
        
   %     break 
   %end



% 
function Control_Panel_Callback(hObject, eventdata, handles)
    % set StaticText (invisible) to control the first access 
    set(handles.t_control_in,'String', 'yes');
    data = ins_data(handles);
    


function ImportVideo_Callback(hObject, eventdata, handles)
 %% Import the file name and path of video and enable the button
 
    path_now = cd();
    [FileNameVid,PathNameVid] = uigetfile({'*.avi';'*.mp4'},'Select the VIDEO file',path_now); 
    handles.FileNameVid = FileNameVid;
    handles.PathNameVid = PathNameVid;
    if PathNameVid == 0
        return
    end
    set(handles.Stop,'Enable', 'on');
    set(handles.Play,'Enable', 'on');
    set(handles.Pause,'Enable', 'on');
    
    %Save the modifications
    guidata(hObject,handles);       
 


function ImportImage_Callback(hObject, eventdata, handles)
%% Import the file name and path of Image and enable the button

    path_now = cd();
    [FileNameIm,PathNameIm] = uigetfile({'*.*';'*.jpg';'*.png';'*.tif';'*.gif';},'Select the IMAGE file',path_now); 
    handles.FileNameIm = FileNameIm;
    handles.PathNameIm = PathNameIm;
    if PathNameIm == 0
        return
    end
    
%%  Phosfened Image
    path_old = cd(handles.PathNameIm);
    if not(exist('Image'))
        Image = imread(handles.FileNameIm);
    end
    cd(path_old);
    ImConv = rgb2gray(Image);
    imshow(ImConv,'Parent',handles.axesReal);
    
    %% Image processing
    [ImProc] = spvImageProcessing(ImConv);
    
    %% Calculating the number of pixel for each phosfene
    [xIm,yIm] = size(ImProc);
    pixph_c = xIm/handles.data.phos_c;  
    pixph_r = yIm/handles.data.phos_r;

    %% Verify rendering not uniform
    if (strcmp(handles.data.RendRow,'Default')==1)
        handles.data.ty_render = 'Default';
        RendRow2 = yIm;
        RendCol2 = xIm;
    else
        handles.data.ty_render = 'Design Not Uniform';
        RendRow2 = handles.data.RendRow;
        RendCol2 = handles.data.RendCol;
    end
    
    %% Insert the variables in the box to pass in the function
    box_margin{1} = handles.data.phos_r;
    box_margin{2} = handles.data.phos_c;  
    box_margin{3} = pixph_r;
    box_margin{4} = pixph_c;
    
    %% Convert image stored
    [ImPhosf] = spvmain2(ImProc,handles.data.type_map,handles.data.mod_phos,...
                box_margin,handles.data.distance,handles.data.ty_render,...
                RendRow2,RendCol2);
            
    %% Adjust image representation
    minV = min(reshape(ImPhosf,1,[]));
    maxV = max(reshape(ImPhosf,1,[]));
    
    
    imshow(ImPhosf,[minV maxV],'Parent',handles.axesPhosfened);
% 
%     %Save the modifications
%     guidata(hObject,handles); 
  


% --- Executes on key press with focus on ImportVideo and none of its controls.
function ImportVideo_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ImportVideo (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on Stop and none of its controls.
function Stop_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to Stop (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Stop.
function Stop_Callback(hObject, eventdata, handles)
    handles.vid_stop = 0;
    guidata(hObject,handles); 

% --- Executes on button press in Pause.
function Pause_Callback(hObject, eventdata, handles)
    handles.vid_pause = 0;
    guidata(hObject,handles); 

    
% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Edit_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)
    close();
   
