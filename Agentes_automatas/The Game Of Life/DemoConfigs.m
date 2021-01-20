classdef DemoConfigs
   
    
    methods
        function initialGrid = getDemoConfig(obj,demoType,gridWidth, gridHeight)
            %Si algo no funcionó se regresa -1 
            initialGrid = -1;
            %Bloque
            if(demoType == DemoType.BLOCK)
                maskWidth = 2;
                maskHeight = 2;
                
                if(gridWidth > maskWidth && gridHeight > maskHeight)
                    x = round((gridWidth - maskWidth)/2);
                    y = round((gridHeight - maskHeight)/2);
                    initialGrid = zeros(gridHeight,gridWidth);
                    for i = y:y+maskHeight-1
                       for j = x:x + maskWidth-1
                           initialGrid(i,j) = 1;
                       end
                    end
                end
                
            elseif(demoType == DemoType.BEEHIVE)
                maskWidth = 4;
                maskHeight = 3;
                mask = zeros(maskHeight,maskWidth);
                %Creamos la mascara 
                mask(1,2) = 1;
                mask(1,3) = 1;
                mask(2,1) = 1;
                mask(2,4) = 1;
                mask(3,2) = 1;
                mask(3,3) = 1;
                %Calcamos la mascara al centro
                if(gridWidth > maskWidth && gridHeight > maskHeight)
                    x = round((gridWidth - maskWidth)/2);
                    y = round((gridHeight - maskHeight)/2);
                    initialGrid = zeros(gridHeight,gridWidth);
                    for i = y:y+maskHeight-1
                       for j = x:x + maskWidth-1
                           initialGrid(i,j) = mask(i-y+1,j-x+1);
                       end
                    end
                end
            
            elseif(demoType == DemoType.BLINKER)
                maskWidth = 3;
                maskHeight = 3;
                mask = zeros(maskHeight,maskWidth);
                mask(1,2) = 1;
                mask(2,2) = 1;
                mask(3,2) = 1;
                
                if(gridWidth > maskWidth && gridHeight > maskHeight)
                    x = round((gridWidth - maskWidth)/2);
                    y = round((gridHeight - maskHeight)/2);
                    initialGrid = zeros(gridHeight,gridWidth);
                    for i = y:y+maskHeight-1
                       for j = x:x+maskWidth-1
                           initialGrid(i,j) = mask(i-y+1,j-x+1);
                       end
                    end
                end
                
                
            elseif(demoType == DemoType.PULSAR)
                maskWidth = 13;
                maskHeight = 13;
                mask = zeros(maskHeight,maskWidth);
                %Mascara del pulsar
                mask(1,3) = 1;
                mask(1,4) = 1;
                mask(1,5) = 1;
                mask(1,9) = 1;
                mask(1,10) =1;
                mask(1,11) = 1;
                mask(3,1) = 1;
                mask(3,6) = 1;
                mask(3,8) = 1;
                mask(3,13) = 1;
                mask(4,1) = 1;
                mask(4,6) = 1;
                mask(4,8) = 1;
                mask(4,13) = 1;
                mask(5,1) = 1;
                mask(5,6) = 1;
                mask(5,8) = 1;
                mask(5,13) = 1;
                mask(6,3) = 1;
                mask(6,4) = 1;
                mask(6,5) = 1;
                mask(6,9) = 1;
                mask(6,10) =1;
                mask(6,11) = 1;
                mask(8,3) = 1;
                mask(8,4) = 1;
                mask(8,5) = 1;
                mask(8,9) = 1;
                mask(8,10) =1;
                mask(8,11) = 1;
                mask(9,1) = 1;
                mask(9,6) = 1;
                mask(9,8) = 1;
                mask(9,13) = 1;
                mask(10,1) = 1;
                mask(10,6) = 1;
                mask(10,8) = 1;
                mask(10,13) = 1;
                mask(11,1) = 1;
                mask(11,6) = 1;
                mask(11,8) = 1;
                mask(11,13) = 1;
                mask(13,3) = 1;
                mask(13,4) = 1;
                mask(13,5) = 1;
                mask(13,9) = 1;
                mask(13,10) =1;
                mask(13,11) = 1;
                if(gridWidth > maskWidth && gridHeight > maskHeight)
                    x = round((gridWidth - maskWidth)/2);
                    y = round((gridHeight - maskHeight)/2);
                    initialGrid = zeros(gridHeight,gridWidth);
                    for i = y:y+maskHeight-1
                       for j = x:x+maskWidth-1
                           initialGrid(i,j) = mask(i-y+1,j-x+1);
                       end
                    end
                end
            elseif(demoType == DemoType.GLIDER)
                maskWidth = 3;
                maskHeight = 3;
                mask = zeros(maskHeight,maskWidth);
                mask(1,2) = 1;
                mask(2,3) = 1;
                mask(3,:) = 1;
                if(gridWidth > maskWidth && gridHeight > maskHeight)
                    initialGrid = zeros(gridHeight,gridWidth);
                    for i = 2:maskHeight+1
                       for j = 2:maskWidth+1
                           initialGrid(i,j) = mask(i-1,j-1);
                       end
                    end
                end
                
            
            elseif(demoType == DemoType.LIGHT_SPACESHIP)
                maskWidth = 5;
                maskHeight = 4;
                mask = zeros(maskHeight,maskWidth);
                mask(1,2) = 1;
                mask(1,5) = 1;
                mask(2,1) = 1;
                mask(3,1) = 1;
                mask(3,5) = 1;
                mask(4,1) = 1;
                mask(4,2) = 1;
                mask(4,3) = 1;
                mask(4,4) = 1;
                if(gridWidth > maskWidth && gridHeight > maskHeight)
                    initialGrid = zeros(gridHeight,gridWidth);
                    x = gridWidth - maskWidth - 1;
                    y = gridHeight - maskHeight - 1;
                    for i = y:y+maskHeight-1
                       for j = x:x+maskWidth-1
                           initialGrid(i,j) = mask(i-y+1,j-x+1);
                       end
                    end
                end
                elseif(demoType == DemoType.RANDOM)
                    initialGrid = zeros(gridHeight,gridWidth);
                    for i = 1:gridHeight
                       for j = 1:gridWidth
                           initialGrid(i,j) = round(rand());
                       end
                    end
                
                
            end
            
            
        end
        
        
    end
    
    
    
    
    
end