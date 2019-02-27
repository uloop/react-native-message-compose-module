using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Message.Compose.Module.RNMessageComposeModule
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNMessageComposeModuleModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNMessageComposeModuleModule"/>.
        /// </summary>
        internal RNMessageComposeModuleModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNMessageComposeModule";
            }
        }
    }
}
