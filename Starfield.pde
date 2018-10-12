Particle[] star = new Particle[1000];
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
		speed = Math.random()*5;
		angle  = (Math.random()*Math.PI*2);
		starColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
		opacity = 200;
	}
	public void move()
	{
		x = x + Math.cos(angle)*speed;
		y = y + Math.sin(angle)*speed;
		opacity = opacity - 1;
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
		if (x > 550) {x = 0;}
	}
	void show()
	{
		fill(starColor);
		ellipse((float)x, (float)y, 50, 60);
	}
}
class JumboParticle extends NormalParticle
{
	public void show()
	{
		fill(starColor);
		ellipse((float)x, (float)y, 100, 100);
	}
}
