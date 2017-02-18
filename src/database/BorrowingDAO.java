package database;

public class BorrowingDAO extends BaseDAO 
{
	public BorrowingDAO()
	{
		super();
	}
	
	public void newBorrowing(Integer userId, Integer documentId) 
	{
		this.execute("call lib_pck_user_action.new_borrowing("
				+userId
				+","+documentId
				+")");
	}
}
