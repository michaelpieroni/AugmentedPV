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

% Last Modified by GUIDE v2.5 22-Oct-2014 16:34:42

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

%H e K vengono utilizzati come passo di campionamento per il passaggio tra
% pixel e mm

function initialize_gui(hObject, eventdata, handles)
%%  Inizialize the variables and set the text to defaul value
    
    set(handles.text_eler,'String',num2str(10));
    handles.data.ele_r = 10;
    
    set(handles.text_elec,'String',num2str(10));
    handles.data.ele_c = 10;
    
    set(handles.text_phr,'String',handles.data.ele_r);
    handles.data.phos_r = handles.data.ele_r;
    
    set(handles.text_phc,'String',handles.data.ele_c);
    handles.data.phos_c = handles.data.ele_c;
    
    set(handles.text_dim,'String',num2str(10));
    handles.data.dim = 10;
    
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
    
    set(handles.text_h,'String',num2str(1));
    handles.data.h = 1;
    
    set(handles.text_k,'String',num2str(1));
    handles.data.k = 1;
    
    guidata(hObject,handles);
    
    
 
function [hObject, eventdata, handles] = update_gui(hObject, eventdata, handles,NewData)

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
    handles.data.dim = NewData.dim; %um
    set(handles.text_dim,'String',handles.data.dim);
    
    %Set new value of time response
    handles.data.r_time = NewData.r_time;
    set(handles.text_tr,'String',handles.data.r_time);
    
    %Set new value of parameter h
    handles.data.h = NewData.h;
    set(handles.text_h,'String',handles.data.h);
    
    %Set new value of parameter k
    handles.data.k = NewData.k;
    set(handles.text_k,'String',handles.data.k);
    
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

    path_old = cd(handles.PathName);
    if not(exist('vid')) 
       vid = vision.VideoFileReader(handles.FileName,'ImageColorSpace','Intensity', 'VideoOutputDataType', 'double' );
    end
    cd(path_old)
    
    %% Get same input data parameters
    %nof =                                  %number of frame for the overall video
    vidHeight = vid.info.VideoSize(2);      %Height video
    vidWidth = vid.info.VideoSize(1);       %Width video
    vidFrate = vid.info.VideoFrameRate;     %Number of frame for second
    vidFormat = vid.info.VideoFormat;       %Format of Video 
    
    %% Calculating the number of pixel for each phosfene
    pixph_c = ceil(vidWidth/handles.data.phos_c)+1;  
    pixph_r = ceil(vidHeight/handles.data.phos_r)+1;
    
    %% Insert the variables in the box to pass in the funtion
    box_margin{1} = handles.data.ele_c;
    box_margin{2} = handles.data.ele_r;  
    box_margin{3} = pixph_r;
    box_margin{4} = pixph_c;
 
    %% don't use modulation = Not Uniform
   
%% http://it.mathworks.com/help/vision/functionlist.html
% da consultare per tutte le funzionalità della computer vision di Matlab
%%    
%     try
            % Check the status of play button
%             isTextStart = strcmp(hObject.String,'Play');
%             isTextCont  = strcmp(hObject.String,'Continue');
%             if isTextStart
%                Two cases: (1) starting first time, or (2) restarting
%                Start from first frame
%                if isDone(vid)
%                   reset(vid);
%                end
%             end
%             if (isTextStart || isTextCont)
%                 hObject.String = 'Pause';
%             else
%                 hObject.String = 'Continue';
%             end


            % Rotate input video frame and display original and rotated
            % frames on figure
%             while strcmp(hObject.String, 'Pause') && ~isDone(vid)

%                 videoPlayerLEFT = vision.VideoPlayer;
%                 videoPlayerRIGHT = vision.VideoPlayer;
                
            viewReal = vision.DeployableVideoPlayer;
            viewPhosf = vision.DeployableVideoPlayer;

            while ~isDone(vid)  
               frame = step(vid); 
               step(viewReal,frame)
               
%                 step(videoPlayerLEFT,frame)
%                 Display input video frame on axis
%                 showFrameOnAxis(handles.axisReal, frame);
%               

                [FrameModified] = spvmain(frame,handles.data.type_map,...
                                  handles.data.mod_phos,handles.data.h,...
                                  handles.data.k,box_margin,vidHeight,vidWidth);
                
%                  step(videoPlayerRIGHT,FrameModified)

                 step(viewPhosf,FrameModified)

%                 Display Phosfened video from on axis
%                 showFrameOnAxis(handles.axisPhosfened, FrameModified);

            end

            % When video reaches the end of file, display "Start" on the
            % play button.
%             if isDone(vid)
%                hObject.String = 'Play';
%             end
%        catch ME
%            % Re-throw error message if it is not related to invalid handle
%            if ~strcmp(ME.identifier, 'MATLAB:class:InvalidHandle')
%                rethrow(ME);
%            end
%        end 


% --- Executes on button press in Stop.
function Stop_Callback(hObject, eventdata, handles)
   

% --- Executes on button press in Pause.
function Pause_Callback(hObject, eventdata, handles)


% --- Executes on button press in x2.
function x2_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Edit_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Sel_ImVid_Callback(hObject, eventdata, handles)
    Select()


% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function Control_Panel_Callback(hObject, eventdata, handles)
    %set StaticText (invisible) to control the first access 
    set(handles.t_control_in,'String', 'si');
    data = ins_data(handles);

    %guidata(hObject,handles);

 

 % --- Executes on button press in Import.
function Import_Callback(hObject, eventdata, handles)
 %% Import the file name and path of video
 
    path_now = cd();
    [FileName,PathName] = uigetfile({'*.avi';'*.mp4'},'Select the VIDEO file',path_now); 
    handles.FileName = FileName;
    handles.PathName = PathName;
    set(handles.Stop,'Enable', 'on')
    set(handles.Play,'Enable', 'on')
    set(handles.Pause,'Enable', 'on')
    set(handles.Next,'Enable', 'on')
    set(handles.x2,'Enable', 'on')
    
    guidata(hObject,handles);       %% Save the modifications
 
% --- Executes on button press in Next.
function Next_Callback(hObject, eventdata, handles)
% hObject    handle to Next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on Import and none of its controls.
function Import_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to Import (see GCBO)
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
