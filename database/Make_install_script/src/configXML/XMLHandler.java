package configXML;

import javax.xml.parsers.SAXParserFactory;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;

import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import java.io.File;
import java.io.IOException;

import javax.xml.XMLConstants;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;

public class XMLHandler 
{  
	private SAXParser parser;
	private String xsdFilePath = "default.xsd";
	
	public XMLHandler()
	{
		try 
		{
			SAXParserFactory spf = SAXParserFactory.newInstance();
			spf.setValidating(true);
			parser = spf.newSAXParser();
		} 
		catch (ParserConfigurationException | SAXException ex) 
		{
			ex.printStackTrace();
		}
	}
	/**
	 * Initialize new object instance
	 * @param String XML Schema file with path
	 */
	public XMLHandler(String xsdFilePath)
	{
		this();
		this.xsdFilePath = xsdFilePath;
	}

	/**
	 * Decide if the XML file is well-formed
	 * @param xmlFilePath
	 */
	public boolean isWellFormedXML(String xmlFilePath)
	{
		try 
		{
			parser.parse(xmlFilePath, new DefaultHandler());
		}
		catch (IOException ex)
		{
			System.err.println("Can not read the file "+xmlFilePath);
			ex.printStackTrace();
		}
		
		catch (SAXException ex) 
		{
			System.err.println("Failed to parse! "+xmlFilePath+" is not a well-formed XML.");
			System.err.println(ex.toString());
			//ex.printStackTrace();
			return false;
		}
		return true;
	}
	
	/**
	 * Decide if the given XML is valid against the instnce XSD Schema
	 * @param xmlFilePath XML file
	 */
	public boolean isValid(String xmlFilePath)
	{
		if (!isWellFormedXML(xmlFilePath))
			return false;
		
		try 
		{
			Source xmlSource = new StreamSource(new File(xmlFilePath));
			Source xsdSource = new StreamSource(new File(xsdFilePath));
			
			SchemaFactory schemaFactory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
			Schema schema = schemaFactory.newSchema(xsdSource);
			Validator validator = schema.newValidator();
			
			validator.validate(xmlSource);
			//System.out.println(xmlSource.getSystemId()+" is valid");
		}
		catch (IOException ex)
		{
			System.err.println("Can not read the file "+xmlFilePath+" or "+xsdFilePath);
			ex.printStackTrace();
		}
		
		catch (SAXException ex) 
		{
			System.err.println("Failed to parse! "+xmlFilePath+" is not valid XML against "+xsdFilePath);
			System.err.println(ex.toString());
			//ex.printStackTrace();
			return false;
		}
		return true;
	}
	/**
	 * Get the configuration data from the valid configuration XML. 
	 * If the file not found or invalid, it returns null
	 * @param String xmlFilePath - configuration XML file name (with path)
	 * @return ConfigDataBean- configuration object
	 */
	public ConfigDataBean extractData(String xmlFilePath)
	{
		if (!this.isValid(xmlFilePath))
			return null;
		
		try 
		{
			ConfigSAXLHandler handler = new ConfigSAXLHandler();
			parser.parse(xmlFilePath, handler);
			ConfigDataBean config = handler.getConfigData();
			return config;
		}
		catch (IOException ex)
		{
			System.err.println("Can not read the file "+xmlFilePath);
			ex.printStackTrace();
		}
		
		catch (SAXException ex) 
		{
			System.err.println("Failed to parse! "+xmlFilePath+" is not a well-formed XML.");
			System.err.println(ex.toString());
		}
		
		return null;
	}
}
