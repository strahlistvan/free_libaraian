package fileIO;
import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

/**
 * Lists all the file in the current folder
 * @author Istvan
 */
public class FileLister 
{
	private String rootDir;
	private ArrayList<String> okExt = new ArrayList<String>();
	private ArrayList<String> filePathList = new ArrayList<String>();
	
	 /** FileFilter: filters only the acceptable files **/
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
    	 System.err.println("Error when listing the directory");
         e.printStackTrace();
      }
	}
	
	/**
	 * Get all the filenames in the current directory, including all subfolders
	 * @param String dirName
	 * @return ArrayList<String> list of filenames in the directory
	 */
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
		okExt = new ArrayList<String>(Arrays.asList(extensions));
	}

	public void setOkExt(ArrayList<String> okExt) {
		this.okExt = okExt;
	}

	public ArrayList<String> getFileList() {
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