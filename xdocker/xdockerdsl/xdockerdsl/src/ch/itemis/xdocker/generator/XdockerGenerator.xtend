/*
 * generated by Xtext 2.9.1
 */
package ch.itemis.xdocker.generator

import ch.itemis.xdocker.XdockerRuntimeModule
import com.google.inject.Guice
import com.google.inject.Inject
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.AbstractGenerator
import org.eclipse.xtext.generator.IFileSystemAccess2
import org.eclipse.xtext.generator.IGeneratorContext
import org.eclipse.xtext.resource.SaveOptions
import org.eclipse.xtext.serializer.impl.Serializer

/**
 * Generates code from your model files on save.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#code-generation
 */
class XdockerGenerator extends AbstractGenerator {

	@Inject val injector = Guice.createInjector(new XdockerRuntimeModule)

	override void doGenerate(Resource resource, IFileSystemAccess2 fsa, IGeneratorContext context) {
//		fsa.generateFile('greetings.txt', 'People to greet: ' + 
//			resource.allContents
//				.filter(typeof(Greeting))
//				.map[name]
//				.join(', '))
		val serializer = injector.getInstance(Serializer);  
		val saveOptions = SaveOptions.newBuilder.format.options
		val content = serializer.serialize(resource.contents.get(0), saveOptions)
		fsa.generateFile('Dockerfile', content)
	}
}
