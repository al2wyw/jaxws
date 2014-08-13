package xpadro.tutorial.rest.model;


public class Apple implements Fruit{
	@FruitName("Apple")
    private String appleName;
    
    @FruitColor
    private String appleColor;
    
    @FruitProvider(id=1,name="�����츻ʿ����",address="����ʡ�������Ӱ�·89�ź츻ʿ����")
    private String appleProvider;
    
    public void setColor(String appleColor) {
        this.appleColor = appleColor;
    }
    public String getColor() {
        return appleColor;
    }
    
    public void setName(String appleName) {
        this.appleName = appleName;
    }
    public String getName() {
        return appleName;
    }
    
    public void setProvider(String appleProvider) {
        this.appleProvider = appleProvider;
    }
    public String getProvider() {
        return appleProvider;
    }
    
    public void displayName(){
        System.out.println("fruit's name is��"+getName());
    }
    
    public void displayColor(){
        System.out.println("fruit's color is��"+getColor());
    }
}
