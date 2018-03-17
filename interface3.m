

function varargout = interface3(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface3_OpeningFcn, ...
                   'gui_OutputFcn',  @interface3_OutputFcn, ...
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


function interface3_OpeningFcn(hObject, eventdata, handles, varargin)

%set(handles.axes1,'visible','off');
%set(handles.axes2,'visible','off');
%set(handles.text5,'visible','off');
%set(handles.text6,'visible','off');
%set(handles.axes4,'visible','off');


handles.output = hObject;
guidata(hObject, handles);


function varargout = interface3_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



function browse1_Callback(hObject, eventdata, handles)

[names1 path1] =uigetfile({'*.png';'*.jpg'},'MultiSelect','on');
set(handles.edit2,'String',path1);
names1
setappdata(handles.figure1,'spat',names1);
setappdata(handles.figure1,'spat_path',path1);
spat_names = getappdata(handles.figure1,'spat')
spat_paths = getappdata(handles.figure1,'spat_path');

try
text = strcat(spat_paths,spat_names(1));
text = num2str(cell2mat(text));
catch
errordlg('only one image selected','Error');
end
total = imread(text);

for i=2:1:length(spat_names)
    text = strcat(spat_paths,spat_names(i));
    text = num2str(cell2mat(text));
    stack = imread(text);
    for k=1:1:1600
    for j=1:1:1200
    
    if stack(j,k)>total(j,k)
        total(j,k) = stack(j,k);
    end
    end
    end
end
imshow(total,'Parent',handles.axes1);




function edit2_Callback(hObject, eventdata, handles)

function spectrums_Callback(hObject, eventdata, handles)
close(handles.figure1);
%



function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function browse2_Callback(hObject, eventdata, handles)

[names2 path2] =uigetfile({'*.png';'*.jpg'},'MultiSelect','off');
set(handles.edit3,'String',path2);
setappdata(handles.figure1,'spec',names2);
setappdata(handles.figure1,'spec_path',path2);
spec_names = getappdata(handles.figure1,'spec');
spec_paths = getappdata(handles.figure1,'spec_path');
text = strcat(spec_paths,spec_names);
myimage = imread(text);
cla(handles.axes4,'reset');
 xyz =  imshow(myimage,'Parent',handles.axes2);
 setappdata(handles.figure1,'image2',myimage);
 set(xyz,'tag','ay7aga','buttondownfcn',{@imageDetails,handles});
handles(1)
histo1 = zeros(1600,1);
histo2 = zeros(1600,1);
arr = zeros(100,1);
%% here adjust pixel positions from which the grpah is taken %%%%%
for i=1:1:1600
    for j=671:1:770
        arr(j-670)= myimage(j,i);
    end
    histo1(i)=mean(arr);
end

arr  = zeros(100,1);
for i=1:1:1600
    for j=431:1:530
        arr(j-430)= myimage(j,i);
    end
    histo2(i)=mean(arr);
end
counting=1;
setappdata(handles.figure1,'counting',counting);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%hold off
%plot(histo2,'r','parent',handles.axes4);
%hold on;
%plot(histo1,'b','Parent',handles.axes4);
%xlabel('pixels');
%ylabel('intensity');
%legend('fake','real');



function edit3_Callback(hObject, eventdata, handles)

function imageDetails(hObject,eventdata,handles)
handles
cursorpoint = get(handles.axes2, 'CurrentPoint');
xs = uint16(cursorpoint(1,1));
ys = uint16(cursorpoint(1,2));
lowerlim=ys-50;
higherlim=ys+50;
sss='g';
leg = {'1st','','',''};
leg{1}
myimage=getappdata(handles.figure1,'image2');
counting=getappdata(handles.figure1,'counting');
switch counting
    case 1
        sss='b';leg{1} ='1st';
    case 2
        sss='r';leg{1} ='1st';leg{2} ='2nd';
    case 3
        sss='k';leg{1} ='1st';leg{2} ='2nd';leg{3}='3rd';
    otherwise
    
        
end
counting = counting+1;
setappdata(handles.figure1,'counting',counting);
histo1 = zeros(1600,1);
arr = zeros(100,1);
 
for i=1:1:1600
    for j=(lowerlim+1):1:higherlim
        arr(j-lowerlim)= myimage(j,i);
    end
    histo1(i)=mean(arr);
end
if (counting<5)
       
    disp('im here')
hold(handles.axes4,'on');
plot(histo1,sss,'parent',handles.axes4);
hold(handles.axes4,'on');
xlabel(handles.axes4,'Pixels');
ylabel(handles.axes4,'Intensity');
legend(handles.axes4,leg,'Location','northwest');
end

function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function axes2_ButtonDownFcn(hObject, eventdata, handles)
cursorpoint = get(handles.axes2, 'CurrentPoint');
cursorpoint
