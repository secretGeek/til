# Visual Studio 2012 crashed with "No exports were found that match the constraint"

    AN exception was encountered while contructing the content of this frame. This information is also logged in "C:\Users\Bambrickl\AppData\Roaming\Microsoft\VisualStudio\11.0\ActivityLog.xml
    Exception details:
    System.ComponentModel.Composition.ImportCardinalityMismatchException: No exports were found that match the constraint:
        ContractName	Microsoft.VisualStudio.Utilities.IContentTypeRegistryService
        RequiredTypeIdentity	Microsoft.VisualStudio.Utilities.IContentTypeRegistryService
            at System.ComponentModel.COmposition.Hosting.ExportProvider.GetExports(ImportDefinition defintiion, AtomicComposition atomicComposition)
        at System.ComponentModel.COmposition.Hosting.ExportProvider.GetExportsCore(Type type, Type metadataViewType, String contractName, ImportCardinality cardinality)


To fix...

    Just delete or rename this folder:
    %AppData%\..\Local\Microsoft\VisualStudio\11.0\ComponentModelCache

    
## Stack Overflow

 * <http://stackoverflow.com/questions/19217506/error-in-microsoft-visual-studio-2012-no-exports-were-found-that-match-the-cons>