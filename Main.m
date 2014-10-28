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

%% Used this metod, but doesn't start the execution.
% handles.data = varargin{1};
% if not(exist(a))
%     initialize_gui(hObject, eventdata, handles)
% else
%     update_gui(a)
% end


%% Try another metod
%%TODO
if exist('data.txt') ~= 2
    initialize_gui(hObject, eventdata, handles)
else
    [var_num,var_string,AllVar] = tblread('data.txt',';');
    [handles.data] = update_gui(hObject, eventdata, handles,AllVar);
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
    set(handles.text_eler,'String',num2str(0));
    set(handles.text_elec,'String',num2str(0));
    set(handles.text_dim,'String',num2str(0));
    set(handles.text_profile,'String','Circle');
    set(handles.text_sp,'String',num2str(0));
    set(handles.text_tr,'String',num2str(0));
    set(handles.text_mpr,'String','Voltage');
    set(handles.text_mph,'String','Amplitude');
    set(handles.text_ty,'String','Uniform');
    set(handles.text_phr,'String',num2str(0));
    set(handles.text_phc,'String',num2str(0));
    set(handles.text_h,'String',num2str(0));
    set(handles.text_k,'String',num2str(0));
    
    
 
function [data] = update_gui(hObject, eventdata, handles,AllVar)
    %Set variables with new value
    data.ele_c = AllVar(1);
    data.ele_r = AllVar(2);
    data.r_space = AllVar(3);
    data.dim = AllVar(4); %um
    data.r_time = AllVar(5);
    data.phos_r = AllVar(6);
    data.phos_c = AllVar(7);
    data.h = AllVar(8);
    data.k = AllVar(9);
    data.mod_phos = AllVar(10);
    data.type_map = AllVar(11);
    data.mod_prot = AllVar(12);
    data.profile =AllVar(13);
    
    %Set static text with new value
    set(handles.text_eler,'String',data.ele_r);
    set(handles.text_elec,'String',data.ele_c);
    set(handles.text_dim,'String',data.dim);
    set(handles.text_profile,'String',data.profile);
    set(handles.text_sp,'String',data.r_space);
    set(handles.text_tr,'String',data.r_time);
    set(handles.text_phr,'String',data.phos_r);
    set(handles.text_phc,'String',data.phos_c);
    set(handles.text_h,'String',data.k);
    set(handles.text_k,'String',data.h);
    set(handles.text_ty,'String',data.type_map);
    set(handles.text_mpr,'String',data.mod_prot);
    set(handles.text_mph,'String',data.mod_phos);
    
    
% --- Executes on button press in Play.
function Play_Callback(hObject, eventdata, handles)
    
    PathVid = get(handles.text_path,'String');
    NameVid = get(handles.text_namevid,'String');
    path_old = cd(PathVid);
        
    if not(exist('vid')) 
       vid = vision.VideoFileReader(NameVid);
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
    
    
    %% Insert the variables in the box to pass in the funtion
    box_margin{1} = data.ele_c;
    box_margin{2} = data.ele_r;  
    box_margin{3} = pixph_r;
    box_margin{4} = pixph_c;
    
    %% Convert VideoFormat to GrayScale
        
    %% SEE the example at....
    % http://www.mathworks.com/help/vision/ref/vision.videofilereader-class.html

    %% Convert video of phosfenes
    
    %% SEE EXAMPLE in http://www.mathworks.com/help/vision/examples/video-display-in-a-custom-user-interface.html
  
    
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

            %TODO: verificare la corretta assegnazione di v_height e v_width 
            while ~isDone(vid)  %|| Stop_KeyPressFcn(hObject, eventdata, handles)
                % Get input video frame and phosfened frame
                frame = step(vid); 
                FrameGray = rgb2gray(frame);
                [FrameModified]=spvmain(FrameGray,data.type_map,data.mod_prot,data.h,data.k,box_margin,vidHeight,vidWidth);
 
                % Display input video frame on axis
                showFrameOnAxis(handles.axisReal, frame);
                % Display Phosfened video from on axis
                showFrameOnAxis(handles.axisPhosfened, FrameModified);
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
%     
%     
    
    
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
 

function ConvertImageElectrode(hObject, eventdata, handles)
     
 
 % --- Executes on button press in Import.
function Import_Callback(hObject, eventdata, handles)
 %% Import the file name and path of video
    path_now = cd();
    [FileName,PathName] = uigetfile({'*.avi';'*.mp4'},'Select the VIDEO file',path_now);
    %set StaticText (invisible) with path and name of just selected video 
    set(handles.text_path,'String',PathName);
    set(handles.text_namevid,'String',FileName);

 
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
