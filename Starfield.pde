Particle[] star = new Particle[500];
Particle odd = new OddballParticle();
Particle big = new JumboParticle();
boolean firework = false;
void setup()
{
	noStroke();;
	size(500, 500);
for(int i = 0; i < star.length; i++)
	{
		star[i] = new NormalParticle();
	}

}
void draw()
{
	background(75,0,130);
	fill(135,149,232);
	rect(0, 250, 500, 250);
	fill(221, 173, 149);
	ellipse(250, 450, 1000, 175);
	odd.show();
	odd.move();
if  (firework == true)
{
	big.show();
	big.move();
	for(int i = 0; i < star.length; i++)
	{
	star[i].show();
	star[i].move();
	}
}
}
void mouseClicked()
{
	firework = true;
}
class NormalParticle implements Particle
{
	double x, y, speed, angle;
	color starColor;
	public float opacity1;

	NormalParticle()
	{
		x = mouseX;
		y = mouseY;
		speed = Math.random()*2;
		angle  = (Math.random()*Math.PI*2);
		starColor = color((int)(Math.random()*75)+175, (int)(Math.random()*75)+150, (int)(Math.random()*55)+150);
		opacity1 = 200;
	}
	public void move()
	{
		x = x + Math.cos(angle)*speed;
		y = y + Math.sin(angle)*speed;
		opacity1 = opacity1 - 2;
		if (opacity1 == 0) {firework = false;}
		if (firework == false) 
		{
			x = mouseX;
			y = mouseY;
			opacity1 = 200;

		}
	}
	public void show()
	{
		fill(starColor, opacity1);
		ellipse((float)x, (float)y, 3, 3);
	}
}
interface Particle
{
	public void move();
	public void show();
}
class OddballParticle implements Particle
{
	double x, y, speed, angle, yC, colorG, colorB;
	color starColor;
	OddballParticle()
	{
		x = 0;
		y = 200;
		starColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
		yC = 3;
		colorG = 140;
		colorB = 0;
	}
	void move()
	{
		x = x + 2.8;
		if (x > 550) 
		{
			x = 0;
			y = 200;
			yC = 3;
			colorB = 0;
			colorG = 140;
		}
		y = y -yC;
		yC = yC -.03;
	}
	void show()
	{
		fill(255.0, (float)colorG, (float)colorB);
		ellipse((float)x, (float)y, 80, 80);
		colorG = colorG + .8;
		colorB = colorB + 1.3;
	}
}
class JumboParticle extends NormalParticle
{
	public void move()
	{
		x = x + Math.cos(angle)*speed;
		y = y + Math.sin(angle)*speed;
		opacity1 = opacity1 - 1;
	}
	public void show()
	{
		fill(starColor, opacity1);
		ellipse((float)x, (float)y, 10, 10);
	}
}
