package configXML;

import javax.xml.parsers.SAXParserFactory;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;

import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
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
	
	public XMLHandler(String xsdFilePath)
	{
		this();
		this.xsdFilePath = xsdFilePath;
	}
	
	public String readFile(String xmlFilePath) throws IOException
	{
		BufferedReader reader = new BufferedReader(new FileReader(xmlFilePath));
		String xmlSource = "";
		String line = reader.readLine();
		while (line != null)
		{
			xmlSource += line;
			line = reader.readLine();
		}
		reader.close();
		
		return xmlSource;
	}
	
	public boolean isWellFormedXML(String xmlFilePath)
	{
		try 
		{
			parser.parse(xmlFilePath, new DefaultHandler());
		}
		catch (IOException ex)
		{
			System.out.println("Can not read the file "+xmlFilePath);
			ex.printStackTrace();
		}
		
		catch (SAXException ex) 
		{
			System.out.println("Failed to parse! "+xmlFilePath+" is not a well-formed XML.");
			System.out.println(ex.toString());
			//ex.printStackTrace();
			return false;
		}
		return true;
	}
	
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
			System.out.println(xmlSource.getSystemId()+" is valid");
		}
		catch (IOException ex)
		{
			System.out.println("Can not read the file "+xmlFilePath+" or "+xsdFilePath);
			ex.printStackTrace();
		}
		
		catch (SAXException ex) 
		{
			System.out.println("Failed to parse! "+xmlFilePath+" is not valid XML against "+xsdFilePath);
			System.out.println(ex.toString());
			//ex.printStackTrace();
			return false;
		}
		System.out.println(xmlFilePath+" is well-formed XML.");
		return true;
	}
	
	public void extractData(String xmlFilePath)
	{
		if (!this.isValid(xmlFilePath))
			return;
		
		try 
		{
			ConfigSAXLHandler handler = new ConfigSAXLHandler();
			parser.parse(xmlFilePath, handler);
			ConfigDataBean config = handler.getConfigData();
			System.out.println(config);
		}
		catch (IOException ex)
		{
			System.out.println("Can not read the file "+xmlFilePath);
			ex.printStackTrace();
		}
		
		catch (SAXException ex) 
		{
			System.out.println("Failed to parse! "+xmlFilePath+" is not a well-formed XML.");
			System.out.println(ex.toString());
		}		
	}
	
}
