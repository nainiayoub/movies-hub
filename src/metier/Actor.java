package metier;


public class Actor  {
	private String actorId;
	private String actorName;
	private String actorNationality;
	private String Image;
	
	public String getImage() {
		return Image;
	}

	public void setImage(String image) {
		Image = image;
	}

	public Actor() {
		
	}
	
	public String getActorId() {
		return actorId;
	}
	public void setActorId(String actorId) {
		this.actorId = actorId;
	}
	public String getActorName() {
		return actorName;
	}
	public void setActorName(String actorName) {
		this.actorName = actorName;
	}
	public String getActorNationality() {
		return actorNationality;
	}
	public void setActorNationality(String actorNationality) {
		this.actorNationality = actorNationality;
	}
	
	
}
