package ma.a1337.etil.vrview;

import io.flutter.plugin.common.PluginRegistry.Registrar;


public class VrviewPlugin {
    
    /**
     * Registering viewfactory
     */
    public static void registerWith(Registrar registrar) {
        registrar
        .platformViewRegistry()
        .registerViewFactory(
                             "vrview", new VrFactory(registrar));
    }
}

