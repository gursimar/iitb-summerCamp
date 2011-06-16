function varargout = particleinB_gui(varargin)
% PARTICLEINB_GUI M-file for particleinB_gui.fig
%      PARTICLEINB_GUI, by itself, creates a new PARTICLEINB_GUI or raises the existing
%      singleton*.
%
%      H = PARTICLEINB_GUI returns the handle to a new PARTICLEINB_GUI or the handle to
%      the existing singleton*.
%
%      PARTICLEINB_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARTICLEINB_GUI.M with the given input arguments.
%
%      PARTICLEINB_GUI('Property','Value',...) creates a new PARTICLEINB_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before particleinB_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to particleinB_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help particleinB_gui

% Last Modified by GUIDE v2.5 12-Jun-2011 19:11:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @particleinB_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @particleinB_gui_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before particleinB_gui is made visible.
function particleinB_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to axis
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to particleinB_gui (see VARARGIN)

% Choose default command line output for particleinB_gui
handles.output = hObject;

set(handles.vx,'Value',3);
set(handles.vy,'Value',4);
set(handles.vz,'Value',1);

set(handles.x,'Value',5);
set(handles.y,'Value',0);
set(handles.z,'Value',0);

set(handles.B,'Value',5);
set(handles.q,'Value',1);
set(handles.m,'Value',5);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes particleinB_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = particleinB_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to axis
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.stop,'String','Stop!!');
guidata(hObject, handles);


v = [get(handles.vx,'Value'), get(handles.vy,'Value'), get(handles.vz,'Value') ];   %initial velocity
B = [0, 0, get(handles.B,'Value') ];                                                %magnitude of B
m = get(handles.m,'Value');                                                        % mass
q = get(handles.q,'Value');                                                         % charge on particle
r0 = [get(handles.x,'Value'), get(handles.y,'Value'), get(handles.z,'Value') ];    % initial position of particle
t = 0;

%find velocity parallel to B and perpendicular to B
v_para = (dot(v,B)/norm(B))*(B/norm(B));
v_per = v-v_para;

% find the circles centre
r = m*(norm(v_per))/(q*norm(B));

theta = atan(v_per(2)/v_per(1))+pi/2;

xc=r0(1)+r*cos(theta);
yc=r0(2)+r*sin(theta);

w= norm(v_per)/r;

%figure(handles.axis);

%to show B's direction
[x_q,y_q] = meshgrid(-15:12:15,-15:12:15);
z_q=8*ones(size(x_q));
u_q=zeros(size(x_q));
v_q=zeros(size(x_q));
w_q=-14*ones(size(x_q));
quiver3(x_q,y_q,z_q,u_q,v_q,w_q);
hold all;

% To draw axis and all
a_a = -15:0.1:15;
z_a = zeros(size(a_a));
plot3(a_a,z_a,z_a,'k','LineWidth',2);
plot3(z_a,a_a,z_a,'k','LineWidth',2);
plot3(z_a,z_a,a_a,'k','LineWidth',2);

% To set axis limits
xlim([-15 15])
ylim([-15 15])
%zlim([-15 15])

rotate3d(handles.axis,'on');

%legend
xlabel ('x direction');
ylabel ('y direction');
zlabel ('z direction');
title('Motion of a particle in a magnetic field');

dt=0.06;


while 1
    x=xc+r*cos(w.*t + pi+theta);
    y=yc+r*sin(w.*t + pi+theta);
    z=v_para*t;
    plot3(x,y,z,'--.');
    hold on
    t=t+dt;
    pause(0.00000000000000000000001)
    
    z_z = get(handles.stop,'String');
    if z_z == 'Stoped'
        break;
    end
end 
guidata(hObject, handles);




% --- Executes on slider movement.
function B_Callback(hObject, eventdata, handles)
% hObject    handle to B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a = get (handles.B,'Value');
set(handles.value_text_b,'String',num2str(a));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function B_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function m_Callback(hObject, eventdata, handles)
% hObject    handle to m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a = get (handles.m,'Value');
set(handles.value_text_m,'String',num2str(a));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function m_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function vx_Callback(hObject, eventdata, handles)
% hObject    handle to vx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get (handles.vx,'Value');
set(handles.value_text_vx,'String',num2str(a));
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function vx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function vy_Callback(hObject, eventdata, handles)
% hObject    handle to vy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a = get (handles.vy,'Value');
set(handles.value_text_vy,'String',num2str(a));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function vy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function vz_Callback(hObject, eventdata, handles)
% hObject    handle to vz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a = get (handles.vz,'Value');
set(handles.value_text_vz,'String',num2str(a));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function vz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function q_Callback(hObject, eventdata, handles)
% hObject    handle to q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a = get (handles.q,'Value');
set(handles.value_text_q,'String',num2str(a));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function q_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function x_Callback(hObject, eventdata, handles)
% hObject    handle to x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a = get (handles.x,'Value');
set(handles.value_text_x,'String',num2str(a));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function y_Callback(hObject, eventdata, handles)
% hObject    handle to y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a = get (handles.y,'Value');
set(handles.value_text_y,'String',num2str(a));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function z_Callback(hObject, eventdata, handles)
% hObject    handle to z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a = get (handles.z,'Value');
set(handles.value_text_z,'String',num2str(a));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axis);


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonUpFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.stop,'String','Stoped');
guidata(hObject, handles);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over vx.
function vx_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to vx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axis
