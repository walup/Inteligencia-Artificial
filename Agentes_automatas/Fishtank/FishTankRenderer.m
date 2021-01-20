classdef FishTankRenderer
   properties 
       fishTank;
       %Color de fondo
       backgroundColor;
       %Image of the fish
       fishImage;
       fishAlpha;
       %Frames per second
       FPS = 2;
       fishImgWidth;
       fishImgHeight;
       
       
       
   end
   
   
   methods 
       function obj = FishTankRenderer(fishTank,fishPath)
           %Guardamos la pecera
           obj.fishTank = fishTank;
           %Background color
           obj.backgroundColor = "#03e3fc";
           %Sprite
           [obj.fishImage,~,obj.fishAlpha] = imread(fishPath);
           obj.fishImage = flip(obj.fishImage);
           obj.fishAlpha = flip(obj.fishAlpha);
           obj.fishImgWidth = 4;
           obj.fishImgHeight = 3;
       end
       
       
       function movieFrames = renderFishMovie(obj,steps)
           
           %The waitbar 
           bar = waitbar(0,"Rendering movie ");
           movieFrames(steps) = struct('cdata',[],'colormap',[]);
           n = obj.fishTank.numberOfFish;
           halfWidth = obj.fishImgWidth/2;
           halfHeight = obj.fishImgHeight/2;
           h = figure();
           tankWidth = obj.fishTank.fishTankWidth;
           tankHeight = obj.fishTank.fishTankHeight;
           for i = 1:steps
              waitbar(i/steps,bar,"frame "+string(i))
              %Clear the frame
              clf(h,'reset')
              xlim([0,tankWidth])
              ylim([0,tankHeight])
              %Draw the background
              hold on 
              rectangle('Position',[0 0 tankWidth tankHeight],'EdgeColor','none','FaceColor',obj.backgroundColor)
              for j  = 1:n
                 
                 f = obj.fishTank.fish(j);
                 %Draw the fish 
                 lowX = f.xPosition - halfWidth;
                 lowY  = f.yPosition - halfHeight;
                 upX = f.xPosition + halfWidth;
                 upY = f.yPosition + halfHeight;
                 %Draw the fish at the specified position 
                 image([lowX,upX],[lowY,upY],obj.fishImage,'AlphaData',obj.fishAlpha)
                 
              end
              hold off
              drawnow
              %Una vez dibujada la pecera guardamos el frame
              movieFrames(i) = getframe(h);
              %Actualizamos el tanque de peces 
              obj.fishTank = obj.fishTank.updateFishTank();
             
           end
           %Borramos la barra de espera
           delete(bar)
       end
       
       
   end
    
    
    
end