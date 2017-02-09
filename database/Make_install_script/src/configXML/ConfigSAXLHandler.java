package configXML;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class ConfigSAXLHandler extends DefaultHandler {

	private String tagName = null;
	private ConfigDataBean configData = new ConfigDataBean();
	
    @Override
    public void startElement(String uri, String localName,
                             String qName, Attributes attributes)
           throws SAXException 
    {
        tagName = qName; 
    }
    
    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
    	if (tagName != null) 
    	{
    		String content = new String(ch, start, length).trim();
    		
    		if ("root_dir".equalsIgnoreCase(tagName))
    		{
    			configData.setRootDir(content);
    		}
    		else if ("output_file".equals(tagName))
    		{
    			configData.setOutputFile(content);
    		}
    		else if ("ext".equals(tagName))
    		{
    			configData.addNewExtension(content);
    		}
    	}
    }

    @Override
    public void endElement(String uri, String localName, String qName)
    		throws SAXException 
    {
        this.tagName = null;
    }
    
    @Override
    public void endDocument() throws SAXException 
    {
    	System.out.println("XML parsing successfully finished!");
    }

	public ConfigDataBean getConfigData() 
	{
		return configData;
	}
    
}
