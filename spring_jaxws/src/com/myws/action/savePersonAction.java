package com.myws.action;
import com.opensymphony.xwork2.*;
import com.myws.serviceImpl.savePersonService;
import com.myws.model.Person;
public class savePersonAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private savePersonService action;
	private Person person;
	public String execute(){
		if(person!=null){
			action.saveAction(person);
			showInTextArea();
			return SUCCESS;
		}
		return INPUT;
	}
	@Override
	public String input() throws Exception {
		// TODO Auto-generated method stub
		
		return INPUT;
	}
	
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	
	public savePersonService getAction() {
		return action;
	}
	public void setAction(savePersonService action) {
		this.action = action;
	}
	public void showInTextArea(){
		ActionContext ctx = ActionContext.getContext();
		String s="test\ntest\ttest";
		ctx.put("test", s);
	}
}
