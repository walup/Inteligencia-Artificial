
classdef Fish
   properties
     %Peces vecinos
     nearbyFishes;
     %Velocidad de los peces
     SPEED = 5;
     %Maximo delta de cambio de dirección de 10°
     MAX_DIRECTION_DELTA = 10*2*pi/360;
     %Dirección del pez (ángulo en radianes)
     direction;
     %Posición
     xPosition;
     yPosition;
     %Velocidad media 
     meanGroupDirection;
   end
   
   methods
       function obj = Fish(xPos,yPos, direction)
           %Inicializamos la posición del pez
           obj.xPosition = xPos;
           obj.yPosition = yPos;
           %Inicializamos la dirección del pez
           obj.direction = direction;
           %Vamos a inicializar como vacio el arreglo de los peces vecinos
           obj.nearbyFishes = [];
       end
       
       %Metodo para actualizar la posición del pez 
       function obj = updatePosition(obj)
           %Si esta vacio el arreglos de peces
           if(isempty(obj.nearbyFishes))
               %Avanzamos en la misma dirección
               obj.xPosition = obj.xPosition + obj.SPEED * cos(obj.direction);
               obj.yPosition = obj.yPosition + obj.SPEED * sin(obj.direction);
               %Modificamos un poco la dirección en forma aleatoria
               deltaAngle = -obj.MAX_DIRECTION_DELTA + rand*(2*obj.MAX_DIRECTION_DELTA);
               xDir = cos(obj.direction + deltaAngle);
               yDir = sin(obj.direction + deltaAngle);
               obj.direction = atan2(yDir,xDir);
               %disp("Random direction")
           
           %Si no esta vacio entonces seguimos al grupo
           else
               obj.xPosition = obj.xPosition + obj.SPEED * cos(obj.meanGroupDirection);
               obj.yPosition = obj.yPosition + obj.SPEED * sin(obj.meanGroupDirection);
               %disp("Follow group")
           end
       end
       
       function obj = setNeighbors(obj,neighbors)
           %Guardamos el nuevo arreglo de vecinos
           obj.nearbyFishes = neighbors;
           %Actualizamos la media de dirección del grupo 
           n = length(neighbors);
           meanX = 0;
           meanY = 0;
           
           for i = 1:n
               meanX = meanX + neighbors(i).xPosition;
               meanY = meanY + neighbors(i).yPosition;
           end
           
           meanX = meanX/n;
           meanY = meanY/n;
           
           obj.meanGroupDirection = atan2(meanY,meanX);
       end
   end
    
end