classdef FishTank
    properties
       %El arreglo de peces
       fish;
       %El radio en el que se examinaran los vecinos
       radius;
       %El tamaño de la pecera
       fishTankWidth;
       fishTankHeight;
       
       %Numero de peces
       numberOfFish;
    end
    
    methods
        %Constructor de la pecera
        function obj = FishTank(width,height,numberOfFish,radius)
            obj.fishTankWidth = width;
            obj.fishTankHeight = height;
            obj.radius = radius;
            %Inicializamos los peces aleatoriamente en la pecera
            obj.numberOfFish = numberOfFish;
            minX = 0;
            maxX = width;
            minY = 0;
            maxY = height;
            minDirection = 0;
            maxDirection = 2*pi;
            
            for i = 1:numberOfFish
               %Posición aleatoria del pez dentro del tanque
               randX =  minX + rand*(maxX - minX);
               randY = minY + rand*(maxY - minY);
               
               %Dirección aleatoria del pez 
               randDirection = minDirection + rand*(maxDirection - minDirection);
               obj.fish = [obj.fish, Fish(randX,randY,randDirection)];    
            end 
        end
        
        
        %Función para actualizar el tanque de peces
        function obj = updateFishTank(obj)
            for i = 1:obj.numberOfFish
                f = obj.fish(i);
                %Obtenemos los vecinos del pez dentro del radio 
                neighbors = obj.getNeighbors(f.xPosition,f.yPosition, i);
                %Actualizamos los vecinos del pez y su nueva posición
                f = f.setNeighbors(neighbors);
                f = f.updatePosition();
                %Efecto pac man en el mundo de la pecera. 
                f.xPosition = mod(f.xPosition,obj.fishTankWidth);
                f.yPosition = mod(f.yPosition,obj.fishTankHeight);
                obj.fish(i) = f;
            end
        end
        
        function arr = getNeighbors(obj,centerX,centerY, fishIndex)
            arr = [];
            for i = 1:obj.numberOfFish
                if(i ~= fishIndex)
                    f = obj.fish(i);
                    d = obj.getToroidalDistance(f.xPosition,f.yPosition,centerX,centerY);
                
                    if(d <= obj.radius)
                        arr = [arr, f]; 
                    end
                end
            end
        end
        
        %Obtiene la distancia considerando el efecto pacman de nuestro
        %mundo
        function dist = getToroidalDistance(obj,x2,y2,x1, y1)
            diffX = abs(x2-x1);
            diffY = abs(y2-y1);
            if(diffX > obj.fishTankWidth/2)
               diffX = obj.fishTankWidth - diffX;
            end
            
            if(diffY > obj.fishTankWidth/2)
               diffY = obj.fishTankHeight - diffY; 
            end
            
            dist = sqrt(diffX^2 + diffY^2);
        end
        
    end
    
    
    
end