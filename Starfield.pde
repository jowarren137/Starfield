Particle[] fireworks;
int myColor;
void setup()
{
	size(600,600);
	fireworks = new Particle[400];
	for(int i = 0; i < fireworks.length; i++)
	{
		fireworks[i] = new Particle();
	}
	fireworks[0] = new OddballParticle();
	myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
	
}
void draw()
{
	background(0);
	fireworks[0].show();
	fireworks[0].move();
	if(fireworks[0].myY <= 280)
	{
		fireworks[0].mySizeL = 0;
		fireworks[0].mySizeS = 0;
		for(int i = 0; i < fireworks.length; i++)
		{
			fireworks[i].show();
			fireworks[i].move();
			if(dist((float)fireworks[i].myX,(float)fireworks[i].myY,300,300) > 250)
			{
				fireworks[i].mySizeL -= 0.5;
				fireworks[i].mySizeS -= 0.25;
				if(fireworks[i].mySizeL <= 0)
				{
					fireworks[i].mySizeL = 0;
					fireworks[i].mySizeS = 0;
				}
			}else if(frameCount >= 350)
			{
				fireworks[i].mySizeL -= 0.5;
				fireworks[i].mySizeS -= 0.25;
				if(fireworks[i].mySizeL <= 0)
				{
					fireworks[i].mySizeL = 0;
					fireworks[i].mySizeS = 0;
				}
			}
		}
	}
}
void mousePressed()
{
	myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
	for(int i = 0; i < fireworks.length; i++)
	{
		fireworks[i] = new Particle();
	}
	fireworks[0] = new OddballParticle();
	frameCount = 0;
}
class Particle
{
	double myX,myY,mySpeed,myAngle;
	float mySizeL,mySizeS;
	Particle()
	{
		myX = myY = 300;
		myAngle = Math.random()*2*Math.PI;
		mySpeed = Math.random()*5;
		mySizeL = 10;
		mySizeS = 5;
	}
	void move()
	{
		myX = myX + Math.cos(myAngle)*mySpeed;
		myY = myY + Math.sin(myAngle)*mySpeed;
	}
	void show()
	{
		noStroke();
		fill(myColor);
		rect((float)myX,(float)myY,mySizeL,mySizeL);
		rect((float)myX-5,(float)myY-5,mySizeS,mySizeS);
		rect((float)myX+10,(float)myY+10,mySizeS,mySizeS);
		rect((float)myX-5,(float)myY+10,mySizeS,mySizeS);
		rect((float)myX+10,(float)myY-5,mySizeS,mySizeS);
	}
}

class OddballParticle extends Particle
{
	OddballParticle()
	{
		myX = 300;
		myY = 600;
		myAngle = -Math.PI;
		mySpeed = 15;
		mySizeL = 30;
		mySizeS = 16;
	}
	void move()
	{
		myY = myY - mySpeed;
	}
	void show()
	{
		noStroke();
		fill(255);
		rect((float)myX-mySizeS/2,(float)myY,mySizeS,mySizeL);
		fill(250,0,0);
		if(myY >= 280)
		{
			triangle((float)myX,(float)myY-12,(float)myX-12,(float)myY-2,(float)myX+12,(float)myY-2);
		}else{
			triangle(0,0,0,0,0,0);
		}
	}
}


