// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.model;

import java.lang.String;

privileged aspect Sequence_Roo_ToString {
    
    public String Sequence.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("SeqCount: ").append(getSeqCount()).append(", ");
        sb.append("SeqName: ").append(getSeqName());
        return sb.toString();
    }
    
}
