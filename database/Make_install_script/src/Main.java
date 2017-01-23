import java.util.ArrayList;

public class Main {

	public static String rootDir;
	
	public static void main(String[] args) {
		rootDir = "C:/Users/Istvan/Documents/PROGI/free_librarian/database";
	    FileReader fr = new FileReader();
	    fr.setRootDir(rootDir);
	    fr.setOkExt("sql");
		ArrayList<String> fileList = 
		  fr.getAllFiles("tables");
	    for (String str: fileList) {
	    	System.out.println(str);
	    }
	}

}
