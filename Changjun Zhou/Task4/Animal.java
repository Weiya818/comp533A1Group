package AnimalAndLog;

public class Animal {
	private String aName;
	private String aSound;
	
	public Animal(String pname, String pSound) {
		aName = pname;
		aSound = pSound;
	}
	
	public String hearSound(int times) {
		return aSound;
	}
	
    public String toString() {
        return aName;
    }

	public static void main(String[] args) {
		Animal bird = new Animal("bird","bibibi");
		Animal cow = new Animal("cow","mumumu");
		
		bird.hearSound(2);
		cow.hearSound(1);
	}
}
