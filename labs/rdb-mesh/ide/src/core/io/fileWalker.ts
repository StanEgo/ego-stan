import { readdirSync, statSync } from "fs";

/**
 *
 * @param root Root folder to scan for files.
 * @param filter Filter file names by RegExp.
 *
 */
export const fileWalker = (
  root: string,
  filter: RegExp = /\.ts$/
): string[] => {
  function recursiveWalker(folder: string, prevFiles: string[] = []): string[] {
    const files = prevFiles;

    readdirSync(folder).forEach(file => {
      const fileName = `${folder}/${file}`;

      if (statSync(fileName).isDirectory()) {
        recursiveWalker(fileName, prevFiles);
      } else if (filter.test(fileName)) {
        files.push(fileName);
      }
    });

    return files;
  }

  return recursiveWalker(root);
};
