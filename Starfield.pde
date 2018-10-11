Particle[] star = new Particle[3000];
Particle odd = new OddballParticle();
void setup()
{
	size(500, 500);
for(int i = 0; i < star.length; i++)
	{
		star[i] = new NormalParticle();
	}

}
void draw()
{
	background(197);
	
	for(int i = 0; i < star.length; i++)
	{
	star[i].show();
	star[i].move();
	}
	odd.show();
	odd.move();
}
class NormalParticle implements Particle
{
	double x, y, speed, angle;
	color starColor;

	NormalParticle()
	{
		x = y = 250.0;
		speed = Math.random()*10;
		angle  = (Math.random()*Math.PI*2);
		starColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
	}
	public void move()
	{
		x = x + Math.cos(angle)*speed;
		y = y + Math.sin(angle)*speed;
	}
	public void show()
	{
		fill(starColor);
		ellipse((float)x, (float)y, 10, 10);
	}
}
interface Particle
{
	public void move();
	public void show();
}
class OddballParticle implements Particle
{
	double x, y, speed, angle;
	color starColor;
	OddballParticle()
	{
		x = 100;
		y = 300;
		starColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
	}
	void move()
	{
		x = x + (Math.random()*15) - 6;
	}
	void show()
	{
		fill(starColor);
		ellipse((float)x, (float)y, 50, 60);
	}
}
class JumboParticle //uses inheritance
{
	//your code here
}

