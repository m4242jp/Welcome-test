package exsample;

import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.TransferHandler;

public class DragFrame extends JFrame implements ActionListener{
    public JTextArea textArea;
    public List<String> pathList = new ArrayList<>();

    public OnClickButton mCallback=null;
    public interface OnClickButton{
        void onClick(List<String> pathList);
    }
    public void setOnClickButton(OnClickButton callback){
        mCallback = callback;
    }

    public DragFrame(){
        init();
    }

    private void init(){
        setBounds(100, 100, 450, 300);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        getContentPane().setLayout(new BoxLayout(getContentPane(), BoxLayout.X_AXIS));
        JScrollPane scrollPane = new JScrollPane();
        getContentPane().add(scrollPane);

        textArea = new JTextArea();
        scrollPane.setViewportView(textArea);

        // ドロップ操作を有効にする
        textArea.setTransferHandler(new DropFileHandler());

        JButton button = new JButton("test");
        button.addActionListener(this);
        button.setActionCommand("ACTION_BTN");
        getContentPane().add(button);
    }
    @Override
    public void actionPerformed(ActionEvent e) {
        String cmd = e.getActionCommand();

        if (cmd.equals("ACTION_BTN")){
           if(mCallback != null)mCallback.onClick(pathList);
        }
    }
    /**
     * ドロップ操作の処理を行うクラス
     */
    private class DropFileHandler extends TransferHandler {

        /**
         * ドロップされたものを受け取るか判断 (ファイルのときだけ受け取る)
         */
        @Override
        public boolean canImport(TransferSupport support) {
            if (!support.isDrop()) {
                // ドロップ操作でない場合は受け取らない
                return false;
            }

            if (!support.isDataFlavorSupported(DataFlavor.javaFileListFlavor)) {
                // ドロップされたのがファイルでない場合は受け取らない
                return false;
            }

            return true;
        }

        /**
         * ドロップされたファイルを受け取る
         */
        @Override
        public boolean importData(TransferSupport support) {
            // 受け取っていいものか確認する
            if (!canImport(support)) {
                return false;
            }

            // ドロップ処理
            Transferable t = support.getTransferable();
            try {
                // ファイルを受け取る
                List<File> files = (List<File>) t.getTransferData(DataFlavor.javaFileListFlavor);
                pathList.clear();

                // テキストエリアに表示するファイル名リストを作成する
                StringBuffer fileList = new StringBuffer();
                for (File file : files){
                    fileList.append(file.getName());
                    fileList.append("\n");

                    pathList.add(file.getAbsolutePath());
                }

                // テキストエリアにファイル名のリストを表示する
                textArea.setText(fileList.toString());
            } catch (UnsupportedFlavorException | IOException e) {
                e.printStackTrace();
            }
            return true;
        }
    }
}
