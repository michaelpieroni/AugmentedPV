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

% Update handles structure
guidata(hObject, handles);


%% Try another metod
%%TODO

if exist('data.txt') ~= 2
    initialize_gui(hObject, eventdata, handles)
else
    [hObject, eventdata, handles] = update_gui(hObject, eventdata, handles);
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
%%  Inizialize the variables and set the text to zero
    global ele_r ele_c dim ty profile sp tr mpr mph
    
    set(handles.text_eler,'String',num2str(10));
    ele_r = 10;
    set(handles.text_elec,'String',num2str(10));
    set(handles.text_dim,'String',num2str(110));
    set(handles.text_profile,'String','Circle');
    set(handles.text_sp,'String',num2str(10));
    set(handles.text_tr,'String',num2str(10));
    set(handles.text_mpr,'String','Voltage');
    set(handles.text_mph,'String','Amplitude');
    set(handles.text_ty,'String','Uniform');
    set(handles.text_phr,'String',num2str(10));
    set(handles.text_phc,'String',num2str(10));
    set(handles.text_h,'String',num2str(10));
    set(handles.text_k,'String',num2str(10));
    
    
    
 
function [hObject, eventdata, handles] = update_gui(hObject, eventdata, handles)

    [var_num,var_string,AllVar] = tblread('data.txt',';');
    
    %Set new value of num electrode column 
    handles.data.ele_c = AllVar(1);
    set(handles.text_elec,'String',handles.data.ele_c);
    %Set new value of num electrode row
    handles.data.ele_r = AllVar(2);
    set(handles.text_eler,'String',handles.data.ele_r);
    %Set new value of space response
    handles.data.r_space = AllVar(3);
    set(handles.text_sp,'String',handles.data.r_space);
    %Set new value of dimension electrode
    handles.data.dim = AllVar(4); %um
    set(handles.text_dim,'String',handles.data.dim);
    %Set new value of time response
    handles.data.r_time = AllVar(5);
    set(handles.text_tr,'String',handles.data.r_time);
    %Set new value of num phosphene row
    handles.data.phos_r = AllVar(6);
    set(handles.text_phr,'String',handles.data.phos_r);
    %Set new value of num phosphene column
    handles.data.phos_c = AllVar(7);
    set(handles.text_phc,'String',handles.data.phos_c);
    %Set new value of parameter h
    handles.data.h = AllVar(8);
    set(handles.text_h,'String',handles.data.h);
    %Set new value of parameter k
    handles.data.k = AllVar(9);
    set(handles.text_k,'String',handles.data.k);
    
    %Set new value of modulation prothesis
    handles.data.mod_prot = AllVar(10);
    switch handles.data.mod_prot
        case 'C'
            handles.data.mod_prot = 'Current';
        case 'V'
            handles.data.mod_prot = 'Voltage';
    end
    set(handles.text_mpr,'String',handles.data.mod_prot);
    
    %Set new value of type map
    handles.data.type_map = AllVar(11);
    switch handles.data.type_map
        case 'U'
            handles.data.type_map = 'Uniform';
        case 'N'
            handles.data.type_map = 'Not Uniform';
    end
    set(handles.text_ty,'String',handles.data.type_map);
    
    %Set new value of modulation phosphenes
    handles.data.mod_phos = AllVar(12);
    switch handles.data.mod_phos
        case 'I'
            handles.data.mod_phos = 'Intensity';
        case 'A'
            handles.data.mod_phos = 'Amplitude';
        case '&'
            handles.data.mod_phos = '& Amplitude-Intensity';
    end
    set(handles.text_mph,'String',handles.data.mod_phos);
    
    %Set new value of profile electrode
    handles.data.profile = AllVar(13);
    switch handles.data.profile
        case 'C'
            handles.data.profile = 'Circle';
        case 'S'
            handles.data.profile = 'Square';
    end
    set(handles.text_profile,'String',handles.data.profile);
    
function [data] = Define_variables(hObject, eventdata, handles)

    data.ele_c = str2num(get(handles.text_eler,'String'));
    data.ele_r = str2num(get(handles.text_elec,'String'));
    data.phos_r = str2num(get(handles.text_phr,'String'));
    data.phos_c = str2num(get(handles.text_phc,'String'));
    data.r_space = str2num(get(handles.text_sp,'String'));
    data.r_time = str2num(get(handles.text_tr,'String'));
    data.dim = str2num(get(handles.text_dim,'String'));
    data.h = str2num(get(handles.text_h,'String'));
    data.k = str2num(get(handles.text_k,'String'));
    data.type_map = get(handles.text_ty,'String');
    data.profile = get(handles.text_profile,'String');
    data.mod_phos = get(handles.text_mph,'String');
    data.mod_prot = get(handles.text_mpr,'String');
    
% --- Executes on button press in Play.
function Play_Callback(hObject, eventdata, handles)

    
    [data] = Define_variables(hObject, eventdata, handles);
    PathVid = get(handles.text_path,'String');
    NameVid = get(handles.text_namevid,'String');
    path_old = cd(PathVid);
    if not(exist('vid')) 
       vid = vision.VideoFileReader(NameVid,'ImageColorSpace','Intensity', 'VideoOutputDataType', 'double' );
    end
    cd(path_old)
    
    %% Get same input data parameters
    %nof =                                  %number of frame for the overall video
    vidHeight = vid.info.VideoSize(2);      %Height video
    vidWidth = vid.info.VideoSize(1);       %Width video
    vidFrate = vid.info.VideoFrameRate;     %Number of frame for second
    vidFormat = vid.info.VideoFormat;       %Format of Video 
    
    %% Calculating the number of pixel for each phosfene
    c = data.phos_c;
    pixph_c = ceil(vidWidth/c);
    r = data.phos_r;
    pixph_r = ceil(vidHeight/r);
    
    data.ele_c = 10;
    data.ele_r = 10;
    data.phos_r = 10;
    data.phos_c =10;
    %% Insert the variables in the box to pass in the funtion
    box_margin{1} = data.ele_c;
    box_margin{2} = data.ele_r;  
    box_margin{3} = pixph_r;
    box_margin{4} = pixph_c;
    
    %% Convert VideoFormat to GrayScale
        
    %% SEE the example at....
    % http://www.mathworks.com/help/vision/ref/vision.videofilereader-class.html
    
    %% SEE EXAMPLE in http://www.mathworks.com/help/vision/examples/video-display-in-a-custom-user-interface.html
    
    
    %% don't use modulation = Not Uniform
    %% problema nel passaggio di questi 4 paramentri in quanto la tabella
    %%preleva dal file solo il primo carattere( cosa analoga a quella che
    %%avviene per le stringhe, risolta con lo switch)
    
    
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

                videoPlayerLEFT=vision.VideoPlayer;
                videoPlayerRIGHT=vision.VideoPlayer;
  
            while ~isDone(vid)  || Stop_Callback(hObject, eventdata, handles)
                
                frame = step(vid); 
                axes(handles.axisReal);
                step(videoPlayerLEFT,frame)
                % Display input video frame on axis
%                 showFrameOnAxis(handles.axisReal, frame);
               
                
                [FrameModified]=spvmain(frame,data.type_map,data.mod_phos,data.h,data.k,box_margin,vidHeight,vidWidth);
                step(videoPlayerRIGHT,FrameModified)
                
                % Display Phosfened video from on axis
                %showFrameOnAxis(handles.axisPhosfened, FrameModified);
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
 data = ins_data(handles);
 

 % --- Executes on button press in Import.
function Import_Callback(hObject, eventdata, handles)
 %% Import the file name and path of video
    path_now = cd();
    [FileName,PathName] = uigetfile({'*.avi';'*.mp4'},'Select the VIDEO file',path_now);
    %set StaticText (invisible) with path and name of just selected video 
    set(handles.text_path,'String',PathName);
    set(handles.text_namevid,'String',FileName);
    set(handles.Stop,'Enable', 'on')
    set(handles.Play,'Enable', 'on')
    set(handles.Pause,'Enable', 'on')
    set(handles.Next,'Enable', 'on')
    set(handles.x2,'Enable', 'on')
 
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
