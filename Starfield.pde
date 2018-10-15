Particle[] star = new Particle[500];
Particle odd = new OddballParticle();
Particle big = new JumboParticle();
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
	background(0);
	odd.show();
	odd.move();
	for(int i = 0; i < star.length; i++)
	{
	star[i].show();
	star[i].move();
	}
	big.show();
	big.move();
	
}
class NormalParticle implements Particle
{
	double x, y, speed, angle;
	color starColor;
	float opacity;

	NormalParticle()
	{
		x = y = 250.0;
		speed = Math.random()*2;
		angle  = (Math.random()*Math.PI*2);
		starColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
		opacity = 200;
	}
	public void move()
	{
		x = x + Math.cos(angle)*speed;
		y = y + Math.sin(angle)*speed;
		opacity = opacity - 2;
	}
	public void show()
	{
		fill(starColor, opacity);
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
		y = 300;
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
			y = 300;
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
	public void show()
	{
		fill(starColor);
		ellipse((float)x, (float)y, 10, 10);
	}
}
