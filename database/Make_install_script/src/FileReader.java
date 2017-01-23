import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

public class FileReader 
{
	private String rootDir;
	private ArrayList<String> okExt = new ArrayList<String>();
	
	private static ArrayList<String> filePathList = new ArrayList<String>();
	
	 /** FileFilter: filters only the acceptable music files **/
	 public FileFilter filter = new FileFilter() 
     {
        @Override
        public boolean accept(File path) 
        {
			  if (path.isDirectory())
				return true;
           
            for (int i=0; i<okExt.size(); ++i)
			{
				if (path.getName().toLowerCase().endsWith(okExt.get(i)))
					return true;
			}	
           return false;
        }
     };

	/** 
     * List recursively the the given directory, and Fill the fileList
     * @param String dirName - Name of the root directory
     * @return void
     **/
	protected void listDirectory(String dirName)
	{
	  File fileDir = null;
      File[] allFiles;
      
      try
      {      
		 fileDir = new File(dirName);
		 //if not directory, then return (recursion end)
		 if (!fileDir.isDirectory())
			return;
		 
         allFiles = fileDir.listFiles(filter);
         
         // for each file in a directory
         for(File file: allFiles)
         {
            //if it is a real file, then add filename to list
        	 if (file.isFile())
        	 {

        		 System.out.println(file.toString());
        		 filePathList.add(file.toString());
        	 }
            //if directory, then open and list it
        	 else if (file.isDirectory())
				listDirectory(file.toString());
         }
      }
      catch(Exception e)
      {
         // if any error occurs
    	  System.out.println("Error when listing the directory");
         e.printStackTrace();
      }
	}
	

	public ArrayList<String> getAllFiles(String dirName)
	{
		filePathList.clear();
		listDirectory(rootDir+"/"+dirName);
		filePathList.removeAll(Collections.singleton(null));
	//	this.toRelativePath();
		return filePathList;
	}
	
	public void toRelativePath() 
	{
		System.out.println("rútdíír:"+rootDir);
		for (int i=0; i<filePathList.size(); ++i) 
		{
			String path = filePathList.get(i).replace(rootDir, "");
			filePathList.set(i, path);
			
		}
	}
    
    public ArrayList<String> getOkExt() {
		return okExt;
	}

	public void setOkExt(String ... extensions) {
		okExt = new ArrayList<>(Arrays.asList(extensions));
	}

	public static ArrayList<String> getFileList() {
		return filePathList;
	}

	public FileFilter getFilter() {
		return filter;
	}

	public String getRootDir() {
		return rootDir;
	}

	public void setRootDir(String rootDir) {
		this.rootDir = rootDir;
	    this.rootDir = this.rootDir.replace("\\", "/");
	}

}