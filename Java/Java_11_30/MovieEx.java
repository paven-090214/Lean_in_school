class Movie{
	private String actor;
	private String title;
	private String director;
	public Movie(String actor, String title, String director) {
		super();
		this.actor = actor;
		this.title = title;
		this.director = director;
	}
	
	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	@Override
	public String toString() {
		return "Movie [actor=" + actor + ", title=" + title + ", director=" + director + "]";
	}
	
}

public class MovieEx {

	public static void main(String[] args) {
		Movie mv1 = new Movie("1", "1", "1");

		System.out.println(mv1);
		System.out.println(mv1.getActor() + mv1.getDirector() + mv1.getTitle());
	}

}
