function Menue_Auswahl_Plot(Zeit, SLP_Winter_Werktag, SLP_Winter_Werktag_ohne, A_w_Werktag, ...
    SLP_Winter_Samstag, SLP_Winter_Samstag_ohne, A_w_Samstag, ...
    SLP_Winter_Sonntag, SLP_Winter_Sonntag_ohne, A_w_Sonntag, ...
    SLP_Sommer_Werktag, SLP_Sommer_Werktag_ohne, A_s_Werktag, ...
    SLP_Sommer_Samstag, SLP_Sommer_Samstag_ohne, A_s_Samstag, ...
    SLP_Sommer_Sonntag, SLP_Sommer_Sonntag_ohne, A_s_Sonntag, ...
    SLP_Ubergang_Werktag, SLP_Ubergang_Werktag_ohne, A_u_Werktag, ...
    SLP_Ubergang_Samstag, SLP_Ubergang_Samstag_ohne, A_u_Samstag, ...
    SLP_Ubergang_Sonntag, SLP_Ubergang_Sonntag_ohne, A_u_Sonntag, ...
    AnzH, AnzA)

%Aufruf des Dropdown-Menüs
gui(Zeit, SLP_Winter_Werktag, SLP_Winter_Werktag_ohne, A_w_Werktag, ...
    SLP_Winter_Samstag, SLP_Winter_Samstag_ohne, A_w_Samstag, ...
    SLP_Winter_Sonntag, SLP_Winter_Sonntag_ohne, A_w_Sonntag, ...
    SLP_Sommer_Werktag, SLP_Sommer_Werktag_ohne, A_s_Werktag, ...
    SLP_Sommer_Samstag, SLP_Sommer_Samstag_ohne, A_s_Samstag, ...
    SLP_Sommer_Sonntag, SLP_Sommer_Sonntag_ohne, A_s_Sonntag, ...
    SLP_Ubergang_Werktag, SLP_Ubergang_Werktag_ohne, A_u_Werktag, ...
    SLP_Ubergang_Samstag, SLP_Ubergang_Samstag_ohne, A_u_Samstag, ...
    SLP_Ubergang_Sonntag, SLP_Ubergang_Sonntag_ohne, A_u_Sonntag, ...
    AnzH, AnzA);
return


function gui(Zeit, SLP_Winter_Werktag, SLP_Winter_Werktag_ohne, A_w_Werktag, ...
    SLP_Winter_Samstag, SLP_Winter_Samstag_ohne, A_w_Samstag, ...
    SLP_Winter_Sonntag, SLP_Winter_Sonntag_ohne, A_w_Sonntag, ...
    SLP_Sommer_Werktag, SLP_Sommer_Werktag_ohne, A_s_Werktag, ...
    SLP_Sommer_Samstag, SLP_Sommer_Samstag_ohne, A_s_Samstag, ...
    SLP_Sommer_Sonntag, SLP_Sommer_Sonntag_ohne, A_s_Sonntag, ...
    SLP_Ubergang_Werktag, SLP_Ubergang_Werktag_ohne, A_u_Werktag, ...
    SLP_Ubergang_Samstag, SLP_Ubergang_Samstag_ohne, A_u_Samstag, ...
    SLP_Ubergang_Sonntag, SLP_Ubergang_Sonntag_ohne, A_u_Sonntag, ...
    AnzH, AnzA)

% Figure erstellen 
h = figure('ToolBar', 'None', ... 
  'MenuBar', 'None', ... 
  'Resize', 'off', ... 
  'Name', 'Plot Selection', ... 
  'NumberTitle', 'off', ... 
  'Position', [300 300 210 110]); 
 
% Label erstellen 
uicontrol(h, 'Style', 'text', ... 
  'Position', [10 85 80 15], ... 
  'String', 'Jahreszeit', ... 
  'HorizontalAlignment', 'Center', 'FontWeight', 'Bold');

uicontrol(h, 'Style', 'text', ... 
  'Position', [10 55 80 15], ... 
  'String', 'Tag', ... 
  'HorizontalAlignment', 'Center', 'FontWeight', 'Bold'); 
 
% Dropdown-Feld1 erstellen 
t = uicontrol(h, 'Style', 'PopupMenu', ... 
  'Position', [105 77 100 25], ... 
  'String', {'Winter' 'Sommer' 'Uebergang'}); 
 
% Dropdown-Feld2 erstellen 
a = uicontrol(h, 'Style', 'PopupMenu', ... 
  'Position', [105 47 100 25], ... 
  'String', {'Werktag', 'Samstag', 'Sonntag'});
 
% Button erstellen 
uicontrol(h, 'Style', 'PushButton', ... 
  'Position', [130 10 75 25], ... 
  'String', 'Ok', ... 
  'Callback', {@OnOkClick, a, t, ...
    Zeit, SLP_Winter_Werktag, SLP_Winter_Werktag_ohne, A_w_Werktag, ...
    SLP_Winter_Samstag, SLP_Winter_Samstag_ohne, A_w_Samstag, ...
    SLP_Winter_Sonntag, SLP_Winter_Sonntag_ohne, A_w_Sonntag, ...
    SLP_Sommer_Werktag, SLP_Sommer_Werktag_ohne, A_s_Werktag, ...
    SLP_Sommer_Samstag, SLP_Sommer_Samstag_ohne, A_s_Samstag, ...
    SLP_Sommer_Sonntag, SLP_Sommer_Sonntag_ohne, A_s_Sonntag, ...
    SLP_Ubergang_Werktag, SLP_Ubergang_Werktag_ohne, A_u_Werktag, ...
    SLP_Ubergang_Samstag, SLP_Ubergang_Samstag_ohne, A_u_Samstag, ...
    SLP_Ubergang_Sonntag, SLP_Ubergang_Sonntag_ohne, A_u_Sonntag, ...
    AnzH, AnzA}); 

% Quit-Button erstellen
uicontrol(h, 'Style', 'PushButton', ... 
  'Position', [20 10 75 25], ... 
  'String', 'Quit', ... 
  'Callback', {@OnQuitClick}); 
 
% Figure darstellen 
set(h, 'Visible', 'on'); 

function [season2, day2] = OnOkClick (obj, e, d, s, ...
    Zeit, SLP_Winter_Werktag, SLP_Winter_Werktag_ohne, A_w_Werktag, ...
    SLP_Winter_Samstag, SLP_Winter_Samstag_ohne, A_w_Samstag, ...
    SLP_Winter_Sonntag, SLP_Winter_Sonntag_ohne, A_w_Sonntag, ...
    SLP_Sommer_Werktag, SLP_Sommer_Werktag_ohne, A_s_Werktag, ...
    SLP_Sommer_Samstag, SLP_Sommer_Samstag_ohne, A_s_Samstag, ...
    SLP_Sommer_Sonntag, SLP_Sommer_Sonntag_ohne, A_s_Sonntag, ...
    SLP_Ubergang_Werktag, SLP_Ubergang_Werktag_ohne, A_u_Werktag, ...
    SLP_Ubergang_Samstag, SLP_Ubergang_Samstag_ohne, A_u_Samstag, ...
    SLP_Ubergang_Sonntag, SLP_Ubergang_Sonntag_ohne, A_u_Sonntag, ...
    AnzH, AnzA)

day = get(d, 'String');
day = day{get(d, 'Value')};
day2 = get(d, 'Value');
 
season = get(s, 'String');
season = season{get(s, 'Value')};
season2 = get(s, 'Value');
 
assignin('base', 'day', day);
assignin('base', 'day2', day2);
assignin('base', 'season', season);
assignin('base', 'season2', season2);

baseLine = 0;
index = 1:96;

switch season2
    
    case 1
        
        switch day2
            
            case 1
                figure ('name','Winter Werktag');
                hold on 
                plot_slp = plot(Zeit, SLP_Winter_Werktag, 'b', 'LineWidth', 1);
                h1 = fill(Zeit(index([1 1:end end])),[baseLine SLP_Winter_Werktag(index)' baseLine],'b','EdgeColor','none');
                datetick('x')
                plot_wasch = plot(Zeit, SLP_Winter_Werktag_ohne, 'g','LineWidth', 1);
                h2 = fill(Zeit(index([1 1:end end])),[baseLine SLP_Winter_Werktag_ohne(index)' baseLine],'g','EdgeColor','none');
                plot_last = plot(Zeit, A_w_Werktag, 'r');
                datetick('x')
                title({' ' 'Winter Werktag' ' '});
                xlabel('Uhrzeit');
                ylabel('kW');
                legend ([plot_slp, plot_wasch, plot_last], 'SLP', 'Restlastgang','Lastgang der Geräte','Location','northwest');
                grid on
                hold off
                disp(' ');
                disp('Winter Werktag');
                disp(' ');
                disp(AnzH);
                disp(' ');
                disp(AnzA);
                disp(' ');
                
            case 2
                figure ('name','Winter Samstag');
                hold on 
                plot_slp = plot(Zeit, SLP_Winter_Samstag, 'b', 'LineWidth', 1);
                h1 = fill(Zeit(index([1 1:end end])),[baseLine SLP_Winter_Samstag(index)' baseLine],'b','EdgeColor','none');
                datetick('x')
                plot_wasch = plot(Zeit, SLP_Winter_Samstag_ohne, 'g','LineWidth', 1);
                h2 = fill(Zeit(index([1 1:end end])),[baseLine SLP_Winter_Samstag_ohne(index)' baseLine],'g','EdgeColor','none');
                plot_last = plot(Zeit, A_w_Samstag, 'r');
                datetick('x')
                title({' ' 'Winter Samstag' ' '});
                xlabel('Uhrzeit');
                ylabel('kW');
                legend ([plot_slp, plot_wasch, plot_last], 'SLP', 'Restlastgang','Lastgang der Geräte','Location','northwest');
                grid on
                hold off
                disp(' ');
                disp('Winter Samstag');
                disp(' ');
                disp(AnzH);
                disp(' ');
                disp(AnzA);
                disp(' ');
                
            case 3
                figure ('name','Winter Sonntag');
                hold on 
                plot_slp = plot(Zeit, SLP_Winter_Sonntag, 'b', 'LineWidth', 1);
                h1 = fill(Zeit(index([1 1:end end])),[baseLine SLP_Winter_Sonntag(index)' baseLine],'b','EdgeColor','none');
                datetick('x')
                plot_wasch = plot(Zeit, SLP_Winter_Sonntag_ohne, 'g','LineWidth', 1);
                h2 = fill(Zeit(index([1 1:end end])),[baseLine SLP_Winter_Sonntag_ohne(index)' baseLine],'g','EdgeColor','none');
                plot_last = plot(Zeit, A_w_Sonntag, 'r');
                datetick('x')
                title({' ' 'Winter Sonntag' ' '});
                xlabel('Uhrzeit');
                ylabel('kW');
                legend ([plot_slp, plot_wasch, plot_last], 'SLP', 'Restlastgang','Lastgang der Geräte','Location','northwest');
                grid on
                hold off
                disp(' ');
                disp('Winter Sonntag');
                disp(' ');
                disp(AnzH);
                disp(' ');
                disp(AnzA);
                disp(' ');
                
        end
        
    case 2
        
        switch day2
            
            case 1
                figure ('name','Sommer Werktag');
                hold on 
                plot_slp = plot(Zeit, SLP_Sommer_Werktag, 'b', 'LineWidth', 1);
                h1 = fill(Zeit(index([1 1:end end])),[baseLine SLP_Sommer_Werktag(index)' baseLine],'b','EdgeColor','none');
                datetick('x')
                plot_wasch = plot(Zeit, SLP_Sommer_Werktag_ohne, 'g','LineWidth', 1);
                h2 = fill(Zeit(index([1 1:end end])),[baseLine SLP_Sommer_Werktag_ohne(index)' baseLine],'g','EdgeColor','none');
                plot_last = plot(Zeit, A_s_Werktag, 'r');
                datetick('x')
                title({' ' 'Sommer Werktag' ' '});
                xlabel('Uhrzeit');
                ylabel('kW');
                legend ([plot_slp, plot_wasch, plot_last], 'SLP', 'Restlastgang','Lastgang der Geräte','Location','northwest');
                grid on
                hold off
                disp(' ');
                disp('Sommer Werktag');
                disp(' ');
                disp(AnzH);
                disp(' ');
                disp(AnzA);
                disp(' ');
                
            case 2
                figure ('name','Sommer Samstag');
                hold on 
                plot_slp = plot(Zeit, SLP_Sommer_Samstag, 'b', 'LineWidth', 1);
                h1 = fill(Zeit(index([1 1:end end])),[baseLine SLP_Sommer_Samstag(index)' baseLine],'b','EdgeColor','none');
                datetick('x')
                plot_wasch = plot(Zeit, SLP_Sommer_Samstag_ohne, 'g','LineWidth', 1);
                h2 = fill(Zeit(index([1 1:end end])),[baseLine SLP_Sommer_Samstag_ohne(index)' baseLine],'g','EdgeColor','none');
                plot_last = plot(Zeit, A_s_Samstag, 'r');
                datetick('x')
                title({' ' 'Sommer Samstag' ' '});
                xlabel('Uhrzeit');
                ylabel('kW');
                legend ([plot_slp, plot_wasch, plot_last], 'SLP', 'Restlastgang','Lastgang der Geräte','Location','northwest');
                grid on
                hold off
                disp(' ');
                disp('Sommer Samstag');
                disp(' ');
                disp(AnzH);
                disp(' ');
                disp(AnzA);
                disp(' ');
                
            case 3
                figure ('name','Sommer Sonntag');
                hold on 
                plot_slp = plot(Zeit, SLP_Sommer_Sonntag, 'b', 'LineWidth', 1);
                h1 = fill(Zeit(index([1 1:end end])),[baseLine SLP_Sommer_Sonntag(index)' baseLine],'b','EdgeColor','none');
                datetick('x')
                plot_wasch = plot(Zeit, SLP_Sommer_Sonntag_ohne, 'g','LineWidth', 1);
                h2 = fill(Zeit(index([1 1:end end])),[baseLine SLP_Sommer_Sonntag_ohne(index)' baseLine],'g','EdgeColor','none');
                plot_last = plot(Zeit, A_s_Sonntag, 'r');
                datetick('x')
                title({' ' 'Sommer Sonntag' ' '});
                xlabel('Uhrzeit');
                ylabel('kW');
                legend ([plot_slp, plot_wasch, plot_last], 'SLP', 'Restlastgang','Lastgang der Geräte','Location','northwest');
                grid on
                hold off
                disp(' ');
                disp('Sommer Sonntag');
                disp(' ');
                disp(AnzH);
                disp(' ');
                disp(AnzA);
                disp(' ');
                
        end
        
    case 3
        
        switch day2
            
            case 1
                figure ('name','Übergang Werktag');
                hold on 
                plot_slp = plot(Zeit, SLP_Ubergang_Werktag, 'b', 'LineWidth', 1);
                h1 = fill(Zeit(index([1 1:end end])),[baseLine SLP_Ubergang_Werktag(index)' baseLine],'b','EdgeColor','none');
                datetick('x')
                plot_wasch = plot(Zeit, SLP_Ubergang_Werktag_ohne, 'g','LineWidth', 1);
                h2 = fill(Zeit(index([1 1:end end])),[baseLine SLP_Ubergang_Werktag_ohne(index)' baseLine],'g','EdgeColor','none');
                plot_last = plot(Zeit, A_u_Werktag, 'r');
                datetick('x')
                title({' ' 'Übergang Werktag' ' '});
                xlabel('Uhrzeit');
                ylabel('kW');
                legend ([plot_slp, plot_wasch, plot_last], 'SLP', 'Restlastgang','Lastgang der Geräte','Location','northwest');
                grid on
                hold off
                disp(' ');
                disp('Übergang Werktag');
                disp(' ');
                disp(AnzH);
                disp(' ');
                disp(AnzA);
                disp(' ');
                
            case 2
                figure ('name','Übergang Samstag');
                hold on 
                plot_slp = plot(Zeit, SLP_Ubergang_Samstag, 'b', 'LineWidth', 1);
                h1 = fill(Zeit(index([1 1:end end])),[baseLine SLP_Ubergang_Samstag(index)' baseLine],'b','EdgeColor','none');
                datetick('x')
                plot_wasch = plot(Zeit, SLP_Ubergang_Samstag_ohne, 'g','LineWidth', 1);
                h2 = fill(Zeit(index([1 1:end end])),[baseLine SLP_Ubergang_Samstag_ohne(index)' baseLine],'g','EdgeColor','none');
                plot_last = plot(Zeit, A_u_Samstag, 'r');
                datetick('x')
                title({' ' 'Übergang Samstag' ' '});
                xlabel('Uhrzeit');
                ylabel('kW');
                legend ([plot_slp, plot_wasch, plot_last], 'SLP', 'Restlastgang','Lastgang der Geräte','Location','northwest');
                grid on
                hold off
                disp(' ');
                disp('Übergang Samstag');
                disp(' ');
                disp(AnzH);
                disp(' ');
                disp(AnzA);
                disp(' ');
                
            case 3
                figure ('name','Übergang Sonntag');
                hold on 
                plot_slp = plot(Zeit, SLP_Ubergang_Sonntag, 'b', 'LineWidth', 1);
                h1 = fill(Zeit(index([1 1:end end])),[baseLine SLP_Ubergang_Sonntag(index)' baseLine],'b','EdgeColor','none');
                datetick('x')
                plot_wasch = plot(Zeit, SLP_Ubergang_Sonntag_ohne, 'g','LineWidth', 1);
                h2 = fill(Zeit(index([1 1:end end])),[baseLine SLP_Ubergang_Sonntag_ohne(index)' baseLine],'g','EdgeColor','none');
                plot_last = plot(Zeit, A_u_Sonntag, 'r');
                datetick('x')
                title({' ' 'Übergang Sonntag' ' '});
                xlabel('Uhrzeit');
                ylabel('kW');
                legend ([plot_slp, plot_wasch, plot_last], 'SLP', 'Restlastgang','Lastgang der Geräte','Location','northwest');
                grid on
                hold off
                disp(' ');
                disp('Übergang Sonntag');
                disp(' ');
                disp(AnzH);
                disp(' ');
                disp(AnzA);
                disp(' ');
                
        end
        
end


function OnQuitClick (obj, e)
close(gcbf);
disp(' ');
disp('Programm beendet');
disp(' ');
return;
