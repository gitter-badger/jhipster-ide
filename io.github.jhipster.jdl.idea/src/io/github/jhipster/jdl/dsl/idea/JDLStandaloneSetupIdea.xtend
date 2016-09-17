/*
 * generated by Xtext 2.10.0
 */
package io.github.jhipster.jdl.dsl.idea

import com.google.inject.Guice
import io.github.jhipster.jdl.dsl.JDLRuntimeModule
import io.github.jhipster.jdl.dsl.JDLStandaloneSetupGenerated
import org.eclipse.xtext.util.Modules2

class JDLStandaloneSetupIdea extends JDLStandaloneSetupGenerated {
	override createInjector() {
		val runtimeModule = new JDLRuntimeModule()
		val ideaModule = new JDLIdeaModule()
		val mergedModule = Modules2.mixin(runtimeModule, ideaModule)
		return Guice.createInjector(mergedModule)
	}
}